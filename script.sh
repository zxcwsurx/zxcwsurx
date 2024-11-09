#!/bin/bash

rm -rf .repo/local_manifests
rm -rf device/xiaomi
rm -rf kernel/xiaomi
rm -rf vendor/xiaomi
rm -rf hardware/xiaomi

# Cleanup to fix SyncErrors raised during branch checkouts
rm -rf platform/prebuilts
rm -rf prebuilts


echo "========================================================================"
echo "DELETED DIRECTORIES"
echo "========================================================================"


# Repo Init
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs --depth=1

echo "========================================================================"
echo "REPO INITIALIZED"
echo "========================================================================"


# Resync

echo "========================================================================"
echo "SYNCING"
echo "========================================================================"

repo sync -j$(nproc --all)

echo "========================================================================"
echo "SYNCED"
echo "========================================================================"



echo "========================================================================"
echo "CLONING REPOS"
echo "========================================================================"

# Clone local_manifests repository
git clone https://github.com/zxcwsurx/android_device_xiaomi_nabu device/xiaomi/nabu
git clone https://github.com/Dark-Matter7232/kernel_msm-4.14-nabu kernel/xiaomi/nabu
git clone https://github.com/zxcwsurx/android_vendor_xiaomi_nabu vendor/xiaomi/nabu
git clone https://github.com/zxcwsurx/android_device_xiaomi_sm8150-common device/xiaomi/sm8150-common
git clone https://github.com/xiaomi-sm8150-devs/proprietary_vendor_xiaomi_sm8150-common vendor/xiaomi/sm8150-common
rm -rf packages/apps/Settings
git clone -b 14.0 https://github.com/zxcwsurx/android_packages_apps_Settings/


echo "========================================================================"
echo "BUILDING........."
echo "========================================================================"


# Set some environment variables
export TZ=Ukraine/Lviv
export BUILD_USERNAME=Hxfuxyy
export BUILD_HOSTNAME=hxfuxyy


# Lunch
. build/envsetup.sh
brunch nabu
