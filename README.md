# openwrt-WR3000S-v1

## LEDs management ##
Place `leds-off.sh` and `leds-on.sh` scripts in `/root/` and make them executable.  
Edit them in order to comment LEDs that your system is not using, otherwise they might get turned on even when unused.

You need mdio-tools in order to manage WAN et LAN1-4 LEDs :
`opkg install mdio-tools`

Go to system crontab using LuCI : `system -> Scheduled Tasks`.  
Here is an example of crontab, turning off LEDs on morning at 7h00 and turning them back on at night at 23h00.
```
# turn LEDs on at 7:00
0 7 * * * /root/leds-on.sh
# turn LEDs off at 23:00
0 23 * * * /root/leds-off.sh
```

In order to keep `/root/leds-*` files after sysupgrade, add them to your `/etc/sysupgrade.conf` configuration file.
