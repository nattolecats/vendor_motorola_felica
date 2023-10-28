#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=felica
VENDOR=motorola

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}"

# Warning headers and guards
write_headers "${VENDOR}" "BOARD_VENDOR"
sed -i 's|felica|motorola|g' "$ANDROIDMK"

# Blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

# Custom felica-vendor.mk
cat << 'EOF' >> "$PRODUCTMK"

PRODUCT_PACKAGES += \
    android.hardware.nfc@1.0 \
    android.hardware.nfc-V1-ndk
EOF

# Custom Android.mk
cat << 'EOF' >> "$ANDROIDMK"
include $(CLEAR_VARS)

NQ_NFC_SYMLINKS := $(TARGET_OUT_SYSTEM_EXT)/app/NQNfcNci/lib/arm64
$(NQ_NFC_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating NQNfcNci symlinks: $@"
	@mkdir -p $@
	$(hide) ln -sf /system_ext/lib64/libsn100nfc_nci_jni.so $@/libsn100nfc_nci_jni.so

ALL_DEFAULT_INSTALLED_MODULES += $(NQ_NFC_SYMLINKS)

EOF

# Finish
write_footers
