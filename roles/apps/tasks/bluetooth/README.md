# Procedure

1. Start the Bluetooth Service
Ensure the Bluetooth service is running by enabling it for boot and starting it immediately: 
```shell
sudo systemctl start bluetooth
```
On some systems, sudo systemctl enable bluetooth might also be necessary to ensure it starts on boot. 

2. Launch bluetoothctl
Open the interactive command-line tool for Bluetooth management: 
```shell
bluetoothctl
```
This will start the bluetoothctl utility, which has its own prompt. 

3. Configure the Controller
Inside bluetoothctl, follow these steps: 
Turn on the Bluetooth controller: The controller is often off by default.
```shell
power on
```
Turn on the Bluetooth agent: This handles pairing requests. 
```shell
agent on
```
Set the default agent: This makes the agent the default for handling authentication. 
```shell
default-agent
```

4. Find and Pair Your Device 
Scan for devices: Start scanning for discoverable devices in your vicinity.
```shell
scan on
```
Wait for your device to appear in the list, noting its MAC address (e.g., 00:1D:43:6D:03:26). 
Pair with the device: Once you have the MAC address, pair with it.
```shell
pair <MAC_ADDRESS>
```
Trust the device: For future connections to be automatic, you may need to trust the device. 
```shell
trust <MAC_ADDRESS>
```

5. Connect to the Device
Finally, establish the connection to the paired and trusted device: 
```shell
connect <MAC_ADDRESS>
```
A "Connection successful" message should indicate a successful connection. 

6. Exit bluetoothctl
You can now exit the utility: 
```shell
exit
```

# My Devices

+ [**LG Sound Bar**](https://wiki.archlinux.org/title/Bluetooth#Front-ends): `bluetoothctl connect D8:E3:5E:03:A9:23`

# Use pulseaudio not pipewire

```shell
sudo apt update -y
sudo apt install pulseaudio pulseaudio-utils pulseaudio-module-bluetooth expect -y
systemctl --user mask pipewire-pulse.service
systemctl --user mask pipewire-pulse.socket
systemctl --user mask wireplumber.service
systemctl --user unmask pulseaudio.service
systemctl --user unmask pulseaudio.socket
systemctl --user start pulseaudio
systemctl --user enable pulseaudio

pacmd list-sinks
pacmd set-default-sink 3
pacmd set-sink-volume 3  65536 - 0
```