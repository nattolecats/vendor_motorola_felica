LINEAGE=https://github.com/LineageOS
ARROW=https://github.com/ArrowOS

git clone $LINEAGE/android_vendor_nxp_opensource_packages_apps_Nfc vendor/nxp/opensource/commonsys/packages/apps/Nfc
git clone $LINEAGE/android_vendor_nxp_opensource_external_libnfc-nci vendor/nxp/opensource/commonsys/external/libnfc-nci
git clone $LINEAGE/android_vendor_nxp_interfaces_opensource_nfc vendor/nxp/opensource/interfaces/nfc
git clone $LINEAGE/android_vendor_nxp_opensource_frameworks vendor/nxp/opensource/commonsys/frameworks
git clone $LINEAGE/android_vendor_nxp_opensource_halimpl vendor/nxp/opensource/sn100x/halimpl -b lineage-19.1-sn100x
git clone $LINEAGE/android_vendor_nxp_opensource_hidlimpl vendor/nxp/opensource/sn100x/hidlimpl -b lineage-19.1-sn100x
git clone $LINEAGE/android_vendor_nxp_nfc vendor/nxp/nfc
git clone $LINEAGE/android_vendor_nxp_secure_element vendor/nxp/secure_element
git clone $LINEAGE/android_vendor_nxp_secure_extns vendor/nxp/secure_element_extns
