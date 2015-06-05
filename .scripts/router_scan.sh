ssh root@192.168.1.1 /usr/sbin/tcpdump -i ppp0 -w - | wireshark -k -i-
