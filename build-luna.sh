#!/bin/bash

export USE_CCACHE=1

export CACHE_DIR=~/.ccache


export KBUILD_BUILD_USER=zacharias.maladroit
export KBUILD_BUILD_HOST=BuildHost

export ARCH=arm64
export PATH=~/android/toolchains/gcc-linaro-6.4.1-2018.03-x86_64_aarch64-linux-gnu/bin/:$PATH
export CROSS_COMPILE=aarch64-linux-gnu-


make lineageos_h930_defconfig

time make -j8

mkbootimg --kernel arch/arm64/boot/Image.gz-dtb --ramdisk ~/android_ROMs/LG_V30/Pie_AOSP_WIP/boot_PE_Pie_WIP/ramdisk --second /dev/null --cmdline "androidboot.hardware=joan user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 sched_enable_hmp=1 sched_enable_power_aware=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true androidboot.usbcontroller=a800000.dwc3 androidboot.selinux=permissive buildvariant=eng" --base 0x00000000 --kernel_offset 0x00008000 --ramdisk_offset 0x02200000 --second_offset 0x00f00000 --os_version 9.0.0 --os_patch_level 2018-8 --tags_offset 0x00000100 --board "" --pagesize 4096 --out ~/android_ROMs/LG_V30/Pie_AOSP_WIP/boot_gadget-cdec_aio_cfgs.img
