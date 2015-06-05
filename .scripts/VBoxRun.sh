#!/bin/bash
#eth0_status=`sudo ethtool eth0 | grep Link | awk '{ print $3 }'`

#if [ $eth0_status = "yes" ]; then
#    VBoxManage modifyvm "win2003" --bridgeadapter1 eth0
#else
#	ppp0_status=`ifconfig | grep ppp0 | awk '{ print $1 }'`
#	if [ppp0_status == "ppp0"]; then
#		VBoxManage modifyvm "2003" --bridgeadapter1 
#	else
#		VBoxManage modifyvm "win2003" --bridgeadapter1 wlan0
#	fi
#fi

VBoxManage startvm win81
