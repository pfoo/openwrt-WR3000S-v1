#! /bin/sh

# https://openwrt.org/toh/cudy/wr3000s_v1#leds
# needs: opkg install mdio-tools
# Comment-out LED that you don't want to manage in both -off and -on script, otherwise you might end with an enabled led that was not enabled by default

# for LEDS System, Internet, WLAN 2.4G and WLAN 5G
echo 1 > /sys/class/leds/white:status/brightness	# status is 'System' LED
echo 1 > /sys/class/leds/white:wan-online/brightness	# wan-online is 'Internet' LED
echo 1 > /sys/class/leds/white:wlan-2ghz/brightness	# wlan-2ghz is '2G' LED
echo phy0tpt > /sys/class/leds/white:wlan-2ghz/trigger	# need to be restored or led won't blink
echo 1 > /sys/class/leds/white:wlan-5ghz/brightness	# wlan-5ghz is '5G' LED
echo phy1tpt > /sys/class/leds/white:wlan-5ghz/trigger	# need to be restored or led wont' blink

# for LEDs WAN and LAN1-4
mdio mt7530-0 0:0x1f raw 0x21 0x000b
