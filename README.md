# Cardiano
A modular, economical, full scale Bluetooth Piano made out of Cardboard Boxes. 

## DEMO
### Please click on the image below to launch the video
[![Cardiano](https://img.youtube.com/vi/PWZmeqmuyn4/0.jpg)](https://www.youtube.com/watch?v=PWZmeqmuyn4 "Spring18 - UCLA CSM117 - Virtuoso")

## First, Set up a Bluetooth Keyboard Emulator

```
1. Update & Upgrade the system to latest version first

$ sudo apt-get update
$ sudo apt-get upgrade
```
```
2. Install Bluetooth and Bluez5

$ sudo apt-get install python-gobject bluez bluez-tools bluez-firmware python-bluez python-dev python-pip
$ sudo pip install evdev 
```

```
3. Kill Bluetooth Daemon and Run it Foreground in a Seperate Window
$ sudo /etc/init.d/bluetooth stop

(sudo /etc/init.d/bluetooth [start|stop|restart|force-reload|status)

open a seperate window
$ sudo /usr/sbin/bluetoothd --nodetach --debug -p time

```

```
4. Clone the Github Repo
$ git clone https://github.com/yaptb/BlogCode.git
server - contains the  bluetooth keyboard emulator code
dbus - contains a DBUS system bus configuration for the btkserver
keyboard - contains a btkserver client application that sends local keystrokes to the emulator
```

```
5. DBUS Configuration
$ cd ~/BlogCode/btkeyboard/dbus
$ sudo cp org.yaptb.btkbservice.conf /etc/dbus-1/system.d
```

```
6. hciconfig to enable bluetooth devices
$ sudo hciconfig hcio
($ sudo hciconfig hcio up)
(only if the status is down, check "up and running" after executing above command)
```
```
7. Update BD address
$ sudo hciconfig hcio
$ cd ~/BlogCode/btkeyboard/server
$ vim btk_server.py
(line 76, change the MY_ADDRESS to BD ADDRESS)
```
```
8. Run the Python Script (Make sure the other window is running)
$ sudo python btk_server.py
```
```
9. Pair
$ sudo /usr/bin/bluetoothctl
[Bluetooth]# agent on
[Bluetooth]# default-agent
[Bluetooth]# scan on
[Bluetooth]# discoverable on
```
```
10. Open the 4th Window
$ cd ~/BlogCode/btkeyboard/keyboard
$ sudo python kb_client.py
```

```
11. Possible ways to deal with timeout
$ sudo hciconfig hcio lm master
```
Reference:            
                     
http://yetanotherpointlesstechblog.blogspot.com/2016/04/emulating-bluetooth-keyboard-with.html?m=1&from=groupmessage&isappinstalled=0            
                     
http://yetanotherpointlesstechblog.blogspot.com.au/2017/08/updated-bluetooth-keyboard-client-code.html          
               
https://www.gadgetdaily.xyz/emulate-a-bluetooth-keyboard-with-the-raspberry-pi/

Credit to Felipe Fialho for the web piano
