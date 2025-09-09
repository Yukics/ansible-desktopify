# Setup

```bash
cp .env.example .env
sed -i 's/example/my_sudo_password/g' .env # needed for packages installation
./init.sh
```

# Sync

```bash
# comment roles not needed to sync again
./init.sh
```