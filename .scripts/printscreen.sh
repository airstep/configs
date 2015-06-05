#!/bin/bash

if [ ! -d /tmp/shot ] ; then
	mkdir /tmp/shot
fi

DATE=`date +%Y-%m-%d\ %H:%M:%S`
scrot -q 100 "/tmp/shot/$DATE.png"
