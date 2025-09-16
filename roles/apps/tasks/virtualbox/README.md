echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian noble contrib" >> /etc/apt/sources.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
sudo apt-get update
sudo apt-get install virtualbox-7.1

# Troubleshoot

```
# error
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
virtualbox-7.2 is already the newest version (7.2.2-170484~Ubuntu~noble).
You might want to run 'apt --fix-broken install' to correct these.
The following packages have unmet dependencies:
 virtualbox-7.2 : Depends: liblzf1 (>= 1.5) but it is not going to be installed
                  Depends: libtpms0 (>= 0.8.0~dev1) but it is not going to be installed
                  Depends: libxcb-cursor0 (>= 0.0.99) but it is not going to be installed
                  Recommends: libsdl-ttf2.0-0 but it is not going to be installed
E: Unmet dependencies. Try 'apt --fix-broken install' with no packages (or specify a solution).
# solution
sudo apt --fix-broken install
```