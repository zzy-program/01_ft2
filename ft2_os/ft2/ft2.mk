$(info ft2 image make start)

export FT2_PRJ = $(TARGET_PRODUCT)
export FT2_MKBOOTIMG := out/host/linux-x86/bin/mkbootimg
export FT2_OUT := out/target/product/$(FT2_PRJ)/recovery
export FT2_ROOT_OUT := out/target/product/$(FT2_PRJ)/recovery/root
export ft2_fstab := ft2/ft2_os/etc/ft2.fstab
export ft2_initrc := ft2/ft2_os/etc
export FT2_MKBOOTFS := out/host/linux-x86/bin/mkbootfs
export FT2_MINIGZIP := out/host/linux-x86/bin/minigzip
export FT2_INSTALLED_RAMDISK_TARGET := out/target/product/$(FT2_PRJ)/ramdisk.img
export FT2_INSTALLED_DEFAULT_PROP_TARGET := out/target/product/htc_ocnuhljapan/root/default.prop
export ft2_recovery_kernel := out/target/product/htc_ocnuhljapan/kernel
export ft2_recovery_sepolicy := out/target/product/$(FT2_PRJ)/recovery/root/sepolicy \
  out/target/product/$(FT2_PRJ)/recovery/root/plat_file_contexts \
  out/target/product/$(FT2_PRJ)/recovery/root/nonplat_file_contexts\
  out/target/product/$(FT2_PRJ)/recovery/root/plat_property_contexts \
  out/target/product/$(FT2_PRJ)/recovery/root/nonplat_property_contexts
export FT2_INTERNAL_RECOVERYIMAGE_FILES := out/target/product/htc_ocnuhljapan/recovery/root/sbin/recovery_ft2
export FT2_TARGET_ROOT_OUT := out/target/product/htc_ocnuhljapan/root

# ft2_target
# $(1): output file
define build-ft2-target
  @echo ----- Making ft2 image ------

  mkdir -p $(FT2_OUT)
  mkdir -p $(FT2_ROOT_OUT)/etc $(FT2_ROOT_OUT)/sdcard $(FT2_ROOT_OUT)/tmp

  @echo Copying baseline ramdisk...
  # Use rsync because "cp -Rf" fails to overwrite broken symlinks on Mac.

  rsync -a --exclude=etc --exclude=sdcard $(IGNORE_RECOVERY_SEPOLICY) $(IGNORE_CACHE_LINK) $(FT2_TARGET_ROOT_OUT) $(FT2_OUT)

  @echo Modifying ramdisk contents...

  # copy recovery resources
  rm -rf $(FT2_ROOT_OUT)/res/images
  cp -rf ft2/ft2_os/res/* $(FT2_ROOT_OUT)/res/

  @echo copy init rc files
  rm -f $(FT2_ROOT_OUT)/init*.rc
  cp -rf $(ft2_initrc)/*.rc $(FT2_ROOT_OUT)/

  cp -f $(ft2_fstab) $(FT2_ROOT_OUT)/etc/ft2.fstab

  # out/target/product/htc_ocnuhljapan/root/default.prop
  cat $(FT2_INSTALLED_DEFAULT_PROP_TARGET) > $(FT2_ROOT_OUT)/prop.default

  ln -sf prop.default $(FT2_ROOT_OUT)/default.prop

  $(FT2_MKBOOTFS) -d $(TARGET_OUT) $(FT2_ROOT_OUT) | $(FT2_MINIGZIP) > $(recovery_ramdisk)
  $(FT2_MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(INTERNAL_MKBOOTIMG_VERSION_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $(1) --id > $(RECOVERYIMAGE_ID_FILE)

  @echo ----- Made ft2 image: $(1) --------
endef

# install ft2_target
INSTALLED_FT2_TARGET := $(PRODUCT_OUT)/ft2.img
$(INSTALLED_FT2_TARGET): $(FT2_MKBOOTFS) $(FT2_MKBOOTIMG) $(FT2_MINIGZIP) \
		$(FT2_INSTALLED_RAMDISK_TARGET) \
		$(FT2_INTERNAL_RECOVERYIMAGE_FILES) \
		$(ft2_recovery_kernel) $(ft2_recovery_sepolicy)
	$(call build-ft2-target, $@)

.PHONY: ft2image
ft2image: $(INSTALLED_FT2_TARGET)
