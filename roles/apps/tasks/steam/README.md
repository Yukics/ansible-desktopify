sudo wget https://repo.steampowered.com/steam/archive/stable/steam.gpg -O /usr/share/keyrings/steam.gpg
sudo wget http://ftp.debian.org/debian/pool/main/m/mesa/libgl1-mesa-glx_22.3.6-1+deb12u1_amd64.deb 
sudo wget http://ftp.debian.org/debian/pool/main/m/mesa/libgl1-mesa-glx_22.3.6-1+deb12u1_i386.deb

sudo tee /etc/apt/sources.list.d/steam-stable.list <<'EOF'
deb [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
deb-src [arch=amd64,i386 signed-by=/usr/share/keyrings/steam.gpg] https://repo.steampowered.com/steam/ stable steam
EOF
$ sudo dpkg --add-architecture i386
$ sudo apt-get update
sudo apt install ./libgl1-mesa-glx_22.3.6-1+deb12u1_amd64.deb ./libgl1-mesa-glx_22.3.6-1+deb12u1_i386.deb
$ sudo apt-get install \
  libgl1-mesa-dri:amd64 \
  libgl1-mesa-dri:i386 \
  steam-launcher