# Board specific SELinux policy variable definitions
MTK_SEPOLICY_PATH:= device/mediatek/sepolicy_vndr

# Build with broken namespaces
# Userspace blobs are still dependent older props that
# do not pass the VTS test cases.
BUILD_BROKEN_VENDOR_PROPERTY_NAMESPACE := true

BOARD_VENDOR_SEPOLICY_DIRS += \
    $(MTK_SEPOLICY_PATH)/basic/non_plat \
    $(MTK_SEPOLICY_PATH)/bsp/non_plat \
    $(MTK_SEPOLICY_PATH)/modem

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    $(MTK_SEPOLICY_PATH)/basic/plat_public \
    $(MTK_SEPOLICY_PATH)/bsp/plat_public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(MTK_SEPOLICY_PATH)/basic/plat_private \
    $(MTK_SEPOLICY_PATH)/bsp/plat_private

ifneq ($(call math_lt,$(PRODUCT_SHIPPING_API_LEVEL),28),)
BOARD_SEPOLICY_DIRS += $(wildcard device/mediatek/sepolicy_vndr/bsp/ota_upgrade)
endif

# Inherit Custom sepolicy for mediatek devices
-include device/custom/sepolicy/mediatek/sepolicy.mk
