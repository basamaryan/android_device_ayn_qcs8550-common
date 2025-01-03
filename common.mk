#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Shipping API
BOARD_SHIPPING_API_LEVEL := 33
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_SHIPPING_API_LEVEL)

# Kernel
PRODUCT_COPY_FILES += \
    kernel/ayn/qcs8550/modules.systemdlkm_blocklist.msm.kalama:$(TARGET_COPY_OUT_VENDOR_DLKM)/lib/modules/system_dlkm.modules.blocklist

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/ayn

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/ayn/qcs8550-common/qcs8550-common-vendor.mk)
