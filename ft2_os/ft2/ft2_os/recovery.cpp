/*
 * Copyright (C) 2007 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <ctype.h>
#include <dirent.h>
#include <errno.h>
#include <fcntl.h>
#include <getopt.h>
#include <inttypes.h>
#include <limits.h>
#include <linux/fs.h>
#include <linux/input.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/klog.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/mount.h>
#include <time.h>
#include <unistd.h>

#include <algorithm>
#include <chrono>
#include <memory>
#include <string>
#include <vector>

#include <adb.h>
#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/parseint.h>
#include <android-base/properties.h>
#include <android-base/stringprintf.h>
#include <android-base/strings.h>
#include <android-base/unique_fd.h>
#include <cutils/android_reboot.h>
#include <cutils/properties.h>
#include <healthd/BatteryMonitor.h>
#include <selinux/android.h>
#include <selinux/label.h>
#include <selinux/selinux.h>
#include <ziparchive/zip_archive.h>

#include "common.h"
#include "device.h"
#include "error_code.h"
#include "minadbd/minadbd.h"
#include "minui/minui.h"
#include "roots.h"
#include "screen_ui.h"
#include "ui.h"

RecoveryUI* ui = nullptr;
static constexpr char log_characters[] = "VDIWEF";

static constexpr const char* DEFAULT_LOCALE = "en-US";
static std::string locale;
Device* device = NULL;
struct selabel_handle* sehandle;

#define INSTALL_SUCCESS 0
#define INSTALL_NONE    1
#define INSTALL_ERROR   2
#define INSTALL_CORRUPT 3

static void run_graphics_test() {
	// Switch to graphics screen.
	ui->ShowText(false);

	ui->SetProgressType(RecoveryUI::INDETERMINATE);
	ui->SetBackground(RecoveryUI::INSTALLING_UPDATE);
	sleep(1);

	ui->SetBackground(RecoveryUI::ERROR);
	sleep(1);

	ui->SetBackground(RecoveryUI::NO_COMMAND);
	sleep(1);

	ui->SetBackground(RecoveryUI::ERASING);
	sleep(1);

	// Calling SetBackground() after SetStage() to trigger a redraw.
	ui->SetStage(1, 3);
	ui->SetBackground(RecoveryUI::INSTALLING_UPDATE);
	sleep(1);
	ui->SetStage(2, 3);
	ui->SetBackground(RecoveryUI::INSTALLING_UPDATE);
	sleep(1);
	ui->SetStage(3, 3);
	ui->SetBackground(RecoveryUI::INSTALLING_UPDATE);
	sleep(1);

	ui->SetStage(-1, -1);
	ui->SetBackground(RecoveryUI::INSTALLING_UPDATE);

	ui->SetProgressType(RecoveryUI::DETERMINATE);
	ui->ShowProgress(1.0, 10.0);
	float fraction = 0.0;
	for (size_t i = 0; i < 100; ++i) {
		fraction += .01;
		ui->SetProgress(fraction);
		usleep(100000);
	}
	ui->ShowText(true);
}

// Display a menu with the specified 'headers' and 'items'. Device specific HandleMenuKey() may
// return a positive number beyond the given range. Caller sets 'menu_only' to true to ensure only
// a menu item gets selected. 'initial_selection' controls the initial cursor location. Returns the
// (non-negative) chosen item number, or -1 if timed out waiting for input.
static int get_menu_selection(const char* const* headers, const char* const* items, bool menu_only,
		int initial_selection, Device* device) {
	// Throw away keys pressed previously, so user doesn't accidentally trigger menu items.
	ui->FlushKeys();

	ui->StartMenu(headers, items, initial_selection);

	int selected = initial_selection;
	int chosen_item = -1;
	while (chosen_item < 0) {
		int key = ui->WaitKey();
		if (key == -1) {  // WaitKey() timed out.
			if (ui->WasTextEverVisible()) {
				continue;
			} else {
				LOG(INFO) << "Timed out waiting for key input; rebooting.";
				ui->EndMenu();
				return -1;
			}
		}

		bool visible = ui->IsTextVisible();
		int action = device->HandleMenuKey(key, visible);

		if (action < 0) {
			switch (action) {
				case Device::kHighlightUp:
					selected = ui->SelectMenu(--selected);
					break;
				case Device::kHighlightDown:
					selected = ui->SelectMenu(++selected);
					break;
				case Device::kInvokeItem:
					chosen_item = selected;
					break;
				case Device::kNoAction:
					break;
			}
		} else if (!menu_only) {
			chosen_item = action;
		}
	}

	ui->EndMenu();
	return chosen_item;
}

static Device::BuiltinAction prompt_and_wait(Device* device, int status) {
	for (;;) {
		printf("zzytest, in prompt_and_wait\n");
		switch (status) {
			case INSTALL_SUCCESS:
			case INSTALL_NONE:
				ui->SetBackground(RecoveryUI::NO_COMMAND);
				break;

			case INSTALL_ERROR:
			case INSTALL_CORRUPT:
				ui->SetBackground(RecoveryUI::ERROR);
				break;
		}
		ui->SetProgressType(RecoveryUI::EMPTY);

		int chosen_item = get_menu_selection(nullptr, device->GetMenuItems(), false, 0, device);
		printf("zzytest, after get_menu_selection\n");

		// Device-specific code may take some action here. It may return one of the core actions
		// handled in the switch statement below.
		Device::BuiltinAction chosen_action =
			(chosen_item == -1) ? Device::REBOOT : device->InvokeMenuItem(chosen_item);

		bool should_wipe_cache = false;
		switch (chosen_action) {
			case Device::ZZYTEST:
				{
					int ret = 0;
					ret = mount("/system", "/dev/block/bootdevice/by-name/system", "ext4", 0, NULL);
					if(ret == 0) {
						ui->Print("system mounted\n");
					}
					else {
						system("mount -t ext4 /dev/block/bootdevice/by-name/system /system");
						ui->Print("errno=%d:%s\n", errno, strerror(errno));
						ui->Print("system mount fail\n");
					}
				}
				break;

			case Device::NO_ACTION:
				break;

			case Device::REBOOT:
			case Device::SHUTDOWN:
			case Device::REBOOT_BOOTLOADER:
				return chosen_action;

			case Device::WIPE_DATA:
				break;

			case Device::WIPE_CACHE:
				break;

			case Device::APPLY_ADB_SIDELOAD:
			case Device::APPLY_SDCARD:
				break;

			case Device::VIEW_RECOVERY_LOGS:
				break;

			case Device::RUN_GRAPHICS_TEST:
				run_graphics_test();
				break;

			case Device::MOUNT_SYSTEM:
				break;
			default:
				break;
		}
		printf("zzytest, prompt_and_wait end\n");
	}
	printf("zzytest, exit prompt_and_wait loop\n");
}

// main entry
int main(int argc, char **argv) {

	printf("zzytest: test14\n");

	// ft2 os start time
	time_t start = time(NULL);
	printf("Starting recovery (pid %d) on %s", getpid(), ctime(&start));

	// todo
	// create_status_monitor_thread();

	load_volume_table();

	bool show_text = false;

	locale = DEFAULT_LOCALE;

	printf("locale is [%s]\n", locale.c_str());

	device = make_device();

	ui = device->GetUI();
	LOG(ERROR) << "device GetUI\n";

	if (!ui->Init(locale)) {
		printf("Failed to initialize UI, use stub UI instead.\n");
		LOG(ERROR) << "Failed to initialize UI, use stub UI instead\n";
		return -1;
	}

	//ui->SetBackground(RecoveryUI::NONE);

	sehandle = selinux_android_file_context_handle();
	selinux_android_set_sehandle(sehandle);
	if (!sehandle) {
		ui->Print("Warning: No file_contexts\n");
	}

	//device->StartRecovery();

	ui->Print("zzytest\n");

	int status = INSTALL_SUCCESS;

	ui->ShowText(true);
	Device::BuiltinAction temp = prompt_and_wait(device, status);

	switch (temp) {
		case Device::SHUTDOWN:
			ui->Print("Shutting down...\n");
			android::base::SetProperty(ANDROID_RB_PROPERTY, "shutdown,");
			break;

		case Device::REBOOT_BOOTLOADER:
			ui->Print("Rebooting to bootloader...\n");
			android::base::SetProperty(ANDROID_RB_PROPERTY, "reboot,bootloader");
			break;

		default:
			ui->Print("other action...\n");
			break;
	}

	while (true) {
		printf("while true pause\n");

		// recall prompt_and_wait
		prompt_and_wait(device, status);
		sleep(5);
	}

	// Should be unreachable.
	return EXIT_SUCCESS;
}
