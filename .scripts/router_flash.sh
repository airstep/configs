scp -r ~/saves/src/openwrt-trunk/bin/ar71xx/openwrt-ar71xx-generic-dir-825-b1-squashfs-backup-loader.bin root@192.168.1.1:/tmp

echo -e "mtd -r erase rootfs_data\nmtd -r write /tmp/firmware.bin firmware" | tftp 192.168.1.1
