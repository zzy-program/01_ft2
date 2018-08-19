/*
 * Copyright (C) 2015 The Android Open Source Project
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


#include <string.h>
#include "device.h"
#include "cutils/properties.h"

#define S_ON "1"
#define S_OFF "0"

static const char* MENU_ITEMS[] = {
    "Reboot system now",
    "Reboot to bootloader",
    "Apply update from ADB",
    "Apply update from SD card",
    "Wipe data/factory reset",
//#ifndef AB_OTA_UPDATER
    "Wipe cache partition",
//#endif  // !AB_OTA_UPDATER
    "Run graphics test",
    "Power off",
    "zzytest1",
    NULL,
};

static const Device::BuiltinAction MENU_ACTIONS[] = {
    Device::REBOOT,
    Device::REBOOT_BOOTLOADER,
    Device::APPLY_ADB_SIDELOAD,
    Device::APPLY_SDCARD,
    Device::WIPE_DATA,
//#ifndef AB_OTA_UPDATER
    Device::WIPE_CACHE,
//#endif  // !AB_OTA_UPDATER
    Device::RUN_GRAPHICS_TEST,
    Device::SHUTDOWN,
    Device::ZZYTEST,
};

#if VENDOR_SOFTBANK
static const char* MENU_ITEMS_remove_factory_reset_for_s_on[] = {
    "Reboot system now",
    "Reboot to bootloader",
    "Apply update from ADB",
    "Apply update from SD card",
    "Wipe cache partition",
    "Run graphics test",
    "Power off",
    NULL,
};

static const Device::BuiltinAction MENU_ACTIONS_remove_factory_reset_for_s_on[] = {
    Device::REBOOT,
    Device::REBOOT_BOOTLOADER,
    Device::APPLY_ADB_SIDELOAD,
    Device::APPLY_SDCARD,
    Device::WIPE_CACHE,
    Device::RUN_GRAPHICS_TEST,
    Device::SHUTDOWN,
};
#endif

static_assert(sizeof(MENU_ITEMS) / sizeof(MENU_ITEMS[0]) ==
              sizeof(MENU_ACTIONS) / sizeof(MENU_ACTIONS[0]) + 1,
              "MENU_ITEMS and MENU_ACTIONS should have the same length, "
              "except for the extra NULL entry in MENU_ITEMS.");

const char* const* Device::GetMenuItems() {
#if VENDOR_SOFTBANK
  char ro_prop[PROPERTY_VALUE_MAX];
  property_get("ro.sf", ro_prop, S_OFF);
  if (strncmp(ro_prop, S_ON, strlen(S_ON) ) == 0) {
    return MENU_ITEMS_remove_factory_reset_for_s_on;
  }
#endif
  return MENU_ITEMS;
}

Device::BuiltinAction Device::InvokeMenuItem(int menu_position) {
#if 0 //VENDOR_SOFTBANK
  char ro_prop[PROPERTY_VALUE_MAX];
  property_get("ro.sf", ro_prop, S_OFF);
  if (strncmp(ro_prop, S_ON, strlen(S_ON) ) == 0) {
    return menu_position < 0 ? NO_ACTION : MENU_ACTIONS_remove_factory_reset_for_s_on[menu_position];
  }
#endif

  return menu_position < 0 ? NO_ACTION : MENU_ACTIONS[menu_position];
}

int Device::HandleMenuKey(int key, bool visible) {
  if (!visible) {
    return kNoAction;
  }

  switch (key) {
    case KEY_DOWN:
    case KEY_VOLUMEDOWN:
      return kHighlightDown;

    case KEY_UP:
    case KEY_VOLUMEUP:
      return kHighlightUp;

    case KEY_ENTER:
    case KEY_POWER:
      return kInvokeItem;

    default:
      // If you have all of the above buttons, any other buttons
      // are ignored. Otherwise, any button cycles the highlight.
      return ui_->HasThreeButtons() ? kNoAction : kHighlightDown;
  }
}

bool Device::PreWipeData() {
    return 0;
}
