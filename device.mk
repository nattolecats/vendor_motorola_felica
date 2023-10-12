#
# Copyright (C) 2023 The 2by2 Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    vendor/nxp/opensource/sn100x \
    vendor/nxp/opensource/commonsys/packages/apps/Nfc \
    vendor/nxp/opensource/commonsys/external/libnfc-nci

# Avoid compile errors
RELAX_USES_LIBRARY_CHECK := true

# Prebuilt FeliCa applications
PRODUCT_PACKAGES += \
    MobileFeliCaClient \
    MobileFeliCaMenuMainApp \
    MobileFeliCaSettingApp \
    MobileFeliCaWebPluginBoot

# NFC
TARGET_USES_NQ_NFC := true

PRODUCT_PACKAGES += \
    Tag \
    NQNfcNci \
    libsn100nfc-nci \
    libsn100nfc_nci_jni \
    nfc_nci.nqx.default.hw

# Force remove unwanted NfcNci
PRODUCT_PACKAGES += RemovePackagesNfcNci

# FeliCa configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/blobs/system_ext/etc/sysconfig/com.felicanetworks.powersave.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/sysconfig/com.felicanetworks.powersave.xml \
    $(LOCAL_PATH)/blobs/product/etc/felica/common.cfg:$(TARGET_COPY_OUT_PRODUCT)/etc/felica/common.cfg \
    $(LOCAL_PATH)/blobs/product/etc/felica/mfm.cfg:$(TARGET_COPY_OUT_PRODUCT)/etc/felica/mfm.cfg \
    $(LOCAL_PATH)/blobs/product/etc/felica/mfs.cfg:$(TARGET_COPY_OUT_PRODUCT)/etc/felica/mfs.cfg \
    $(LOCAL_PATH)/blobs/system/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-nci.conf

# Permissions
$(foreach f, $(wildcard $(LOCAL_PATH)/blobs/system/etc/permissions/*.xml), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/$(notdir $f)))
$(foreach f, $(wildcard $(LOCAL_PATH)/blobs/product/etc/permissions/*.xml), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/$(notdir $f)))
$(foreach f, $(wildcard $(LOCAL_PATH)/blobs/system_ext/etc/permissions/*.xml), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/$(notdir $f)))

# Framework jars
$(foreach f, $(wildcard $(LOCAL_PATH)/blobs/system/framework/*.jar), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/framework/$(notdir $f)))
$(foreach f, $(wildcard $(LOCAL_PATH)/blobs/system_ext/framework/*.jar), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/$(notdir $f)))

# Libraries
$(foreach f, $(wildcard $(LOCAL_PATH)/blobs/system_ext/lib/*.so), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM_EXT)/lib/$(notdir $f)))
$(foreach f, $(wildcard $(LOCAL_PATH)/blobs/system_ext/lib64/*.so), \
    $(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM_EXT)/lib64/$(notdir $f)))
