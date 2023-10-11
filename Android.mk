#
# Copyright (C) 2023 The 2by2 Project
#
# SPDX-License-Identifier: Apache-2.0
#

ifeq ($(BOARD_VENDOR),motorola)

include $(call all-subdir-makefiles)

include $(CLEAR_VARS)

LOCAL_MODULE := RemovePackagesNfcNci
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional

LOCAL_OVERRIDES_PACKAGES := NfcNci

LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := /dev/null

include $(BUILD_PREBUILT)

endif
