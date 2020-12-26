#!/bin/bash

if (( $EUID != 0 )); then
        echo "Run as root."
        exit
else (
        echo "Unblocking WiFi..."
        /etc/init.d/connman restart
        rfkill unblock wifi
        ip link set wlan0 up
     )
fi
