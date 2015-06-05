#!/bin/bash

if [ ! -d /tmp/shot/android ] ; then
	mkdir -p /tmp/shot/android
fi

DATE=`date +%Y-%m-%d\ %H:%M:%S`
adb shell screencap -p | sed 's/\r$//' > "/tmp/shot/android/$DATE.png"
