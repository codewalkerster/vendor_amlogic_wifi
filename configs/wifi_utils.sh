# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2025 Amlogic Inc. All rights reserved.
#
#!/bin/bash

SCRIPT_PATH=$(realpath "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

echo "WIFI_SRC_FILES = [" > $SCRIPT_DIR/wifi_files_list.bzl

for i in $*
do
	case "$i" in
		w2)
		if [ -f $SCRIPT_DIR/../amlogic/w2/BUILD.bazel ];then
			echo "\"//driver_modules/wifi_bt/wifi/amlogic/w2:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
		fi
		;;
		w2l)
		if [ -f $SCRIPT_DIR/../amlogic/w2l/BUILD.bazel ];then
			echo "\"//driver_modules/wifi_bt/wifi/amlogic/w2l:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
		fi
		;;
		w1u)
		if [ -f $SCRIPT_DIR/../amlogic/w1u/project_w1u/BUILD.bazel ];then
			echo "\"//driver_modules/wifi_bt/wifi/amlogic/w1u/project_w1u:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
		fi
		;;
		ap6398s)
		if [ -f $SCRIPT_DIR/../broadcom/ap6xxx/bcmdhd.101.10.591.x/BUILD.bazel ];then
			echo "\"//driver_modules/wifi_bt/wifi/broadcom/ap6xxx/bcmdhd.101.10.591.x:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
		fi
	esac
done

echo "]" >> $SCRIPT_DIR/wifi_files_list.bzl

echo "BT_SRC_FILES = [" >> $SCRIPT_DIR/wifi_files_list.bzl
if [ -f $SCRIPT_DIR/../../bt/amlogic/usb_driver_bt/BUILD.bazel ];then
	echo "\"//driver_modules/wifi_bt/bt/amlogic/usb_driver_bt:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
fi
if [ -f $SCRIPT_DIR/../../bt/amlogic/w1u_driver_bt/BUILD.bazel ];then
	echo "\"//driver_modules/wifi_bt/bt/amlogic/w1u_driver_bt:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
fi
if [ -f $SCRIPT_DIR/../../bt/amlogic/w2l_driver_bt/BUILD.bazel ];then
	echo "\"//driver_modules/wifi_bt/bt/amlogic/w2l_driver_bt:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
fi
if [ -f $SCRIPT_DIR/../../bt/mtk/bt_driver_usb/BUILD.bazel ];then
	echo "\"//driver_modules/wifi_bt/bt/mtk/bt_driver_usb:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
fi
if [ -f $SCRIPT_DIR/../../bt/realtek/rtk_btusb/BUILD.bazel ];then
	echo "\"//driver_modules/wifi_bt/bt/realtek/rtk_btusb:driver_files\"," >> $SCRIPT_DIR/wifi_files_list.bzl
fi
echo "]" >> $SCRIPT_DIR/wifi_files_list.bzl
