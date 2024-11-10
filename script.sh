#!/bin/bash

rm -rf .repo/local_manifests/


# Initialize local repository
repo init -u https://github.com/crdroidandroid/android.git -b 14.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/zxcwsurx/local_manifests_nabu -b crdroid-14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=Hxfuxyy
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Lunch  
. build/envsetup.sh
brunch nabu

