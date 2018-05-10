# Cardiano
A modular, economical, full scale Bluetooth Piano made out of Cardboard Boxes. 

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
$ cd BlogCode/btkeyboard/dbus
$ sudo cp org.yaptb.btkbservice.conf /etc/dbus-1/system.d
```

```
6. hciconfig to enable bluetooth devices
$ sudo hciconfig hcio
($ sudo hciconfig hcio up)
(only if the status is down, check "up and running" after executing above command)
```
