sudo ifconfig wlan0 down
sudo iwconfig wlan0 essid "akunamatata_155"
sudo ifconfig wlan0 up

if [ -e /var/run/wpa_supplicant/wlan0 ];
then
    echo "I'm found wpa2 session, master. Nice surfing ;)"
else
    echo "Create new wpa2 session, master."
    sudo wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/acuna.conf
fi

echo "echo nameserver 192.168.1.1 > /etc/resolv.conf" | sudo sh
sudo ifconfig wlan0 192.168.1.7 netmask 255.255.255.0 broadcast 192.168.1.255
sudo route add default gw 192.168.1.1
