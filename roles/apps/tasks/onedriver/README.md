sudo add-apt-repository --remove ppa:jstaf/onedriver
sudo apt install onedriver

export MOUNTPOINT=~/OneDrive

# create the mountpoint and determine the service name
mkdir -p $MOUNTPOINT
export SERVICE_NAME=$(systemd-escape --template onedriver@.service --path $MOUNTPOINT)

# mount onedrive and set it to automatically mount on login
systemctl --user daemon-reload
systemctl --user enable --now $SERVICE_NAME

# check onedriver's logs for the current day
journalctl --user -u $SERVICE_NAME --since today