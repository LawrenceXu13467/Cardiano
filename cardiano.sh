#!/bin/bash
sudo apt-get update
sudo apt-get upgrade

sudo apt-get install python-gobject bluez bluez-tools bluez-firmware python-bluez python-dev python-pip
sudo pip install evdev 

sudo /etc/init.d/bluetooth stop
sudo /usr/sbin/bluetoothd --nodetach --debug -p time

git clone https://github.com/yaptb/BlogCode.git
cd ~/BlogCode/btkeyboard/dbus
sudo cp org.yaptb.btkbservice.conf /etc/dbus-1/system.d
sudo hciconfig hcio up
sudo hciconfig hcio
cd ~/BlogCode/btkeyboard/server
sudo python btk_server.py
sudo /usr/bin/bluetoothctl
agent on
default-agent
scan on
discoverable on
cd ~/BlogCode/btkeyboard/keyboard
sudo python kb_client.py
sudo hciconfig hcio lm master