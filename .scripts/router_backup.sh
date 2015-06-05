ssh root@192.168.1.1 'cd /; tar czf - etc/config root' > ~/saves/router/backup/openwrt-backup-`date +%Y-%m-%d_%H-%M-%S`.tar.gz
