# List screens 
```bash
xrandr -q | grep "^[^\ ].*" | grep -v Screen
```

# Set screen location and refresh

```bash
xrandr  --output DP-0 --mode 1920x1080 --pos 0x0 --rotate normal --rate 239.76 --primary
xrandr  --output DP-2 --mode 2560x1440 --pos 1920x360 --rotate normal --rate 144.01
```

## Easy way

```bash
xrandr  --output DP-0 --auto --rotate normal --rate 239.76 --primary
xrandr  --output DP-2 --auto --rotate normal --rate 144.01 --right-of DP-0

```

# Turn off external monitor

```bash
xrandr --output DP-1 --off
```

# Set up profiles 

```bash
sudo apt install autorandr
autorandr --save dp02
autorandr --load dp02
autorandr --list
```
