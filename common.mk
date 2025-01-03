#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Shipping API
BOARD_SHIPPING_API_LEVEL := 33
PRODUCT_SHIPPING_API_LEVEL := $(BOARD_SHIPPING_API_LEVEL)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit from the proprietary files makefile.
$(call inherit-product, vendor/ayn/qcs8550-common/qcs8550-common-vendor.mk)
