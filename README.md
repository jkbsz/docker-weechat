# Docker weechat

Docker instance to run weechat with persistent volume for logs and configuration.

Connect via SSH using key stored in authorized_keys

# Build and run

```
docker-compose build
docker-compose up -d
```

# Use

```
# connect
ssh -p 2022 root@localhost

# attach
screen -R

# detach CTRL-A D
```

# Upgrade

```
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

