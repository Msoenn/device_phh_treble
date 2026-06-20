TARGET_GAPPS_ARCH := arm
include build/make/target/product/aosp_arm.mk
$(call inherit-product, device/phh/treble/base.mk)

$(call inherit-product-if-exists, vendor/gapps/arm/arm-vendor.mk)
$(call inherit-product, device/phh/treble/lineage.mk)

PRODUCT_NAME := lineage_a64_bgNE
PRODUCT_BRAND := google
PRODUCT_MODEL := Generic System

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

LINEAGE_BUILDTYPE := GAPPS
LINEAGE_BUILD := GSI

#EROFS
LINEAGE_EXTRAVERSION := -EROFS
GSI_FILE_SYSTEM_TYPE := erofs
BOARD_EROFS_COMPRESSOR := lz4hc,9
TARGET_PRODUCT_PROP += device/phh/treble/product.prop
