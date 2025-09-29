#!/usr/bin/expect -f

# my soundbar MAC
set device D8:E3:5E:03:A9:23 

spawn bluetoothctl
expect "Agent registered"
send -- "power on\r"
expect "Changing power on succeeded"
sleep 0.5 
send -- "agent on\r"
expect "Agent is already registered"
sleep 0.5 
send -- "default-agent\r"
expect "Default agent request successful"
sleep 0.5 
send -- "remove $device\r"
expect -re "Device.*"
sleep 0.5 
send -- "scan on\r"
expect -re ".*$device.*"
sleep 0.5 
send -- "pair $device\r"
expect "Pairing successful"
sleep 0.5 
send -- "connect $device\r"
expect "Connection successful"
sleep 0.5 
send -- "trust $device\r"
expect "trust succeeded"
sleep 0.5 
send -- "exit\r"
expect eof
