TARGET_GAPPS_ARCH := arm
include build/make/target/product/aosp_arm.mk
$(call inherit-product, device/phh/treble/base.mk)


$(call inherit-product, device/phh/treble/lineage.mk)

PRODUCT_NAME := lineage_a64_bvN4
PRODUCT_BRAND := google
PRODUCT_MODEL := Generic System

# Overwrite the inherited "emulator" characteristics
PRODUCT_CHARACTERISTICS := device

LINEAGE_BUILDTYPE := VANILLA
LINEAGE_BUILD := GSI

#EXT4
LINEAGE_EXTRAVERSION := -EXT4
PRODUCT_EXTRA_VNDK_VERSIONS += 28 29
