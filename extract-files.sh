#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

DEVICE=amogus
VENDOR=motorola

# Load extract utilities and do some sanity checks.
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction.
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in

    # camera shim
    vendor/lib/hw/camera.trinket.so)
        patchelf --add-needed libcamera_shim.so "${2}"
        sed -i 's/_ZN7android17CameraHalWatchdog12AutoWatchdog13startWatchdogEv/_ZN7android17CameraHalWatchdog12AutoWatchdog13startWatchhogEv/g' "${2}"
        sed -i 's/libthermalclient/libthermapclient/g' "${2}"
        ;;

    # vstab
    vendor/lib/libmmcamera2_pproc_modules.so)
        sed -i 's/ro.product.manufacturer/ro.broduct.manufacturer/g' "${2}"
        ;;

    # gbp shim
    vendor/lib/libmot_gpu_mapper.so)
        patchelf --add-needed libgbp_shim.so "${2}"
        ;;

    system_ext/etc/permissions/moto-telephony.xml)
        sed -i "s#/system/#/system_ext/#" "${2}"
        ;;

    esac
}

# Initialize the helper.
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"
extract "${MY_DIR}/proprietary-files-rav.txt" "${SRC}" "${KANG}" --section "${SECTION}"
extract "${MY_DIR}/proprietary-files-sofia.txt" "${SRC}" "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
