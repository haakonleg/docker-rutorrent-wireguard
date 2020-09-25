# docker-rutorrent-wireguard

Docker image for rutorrent based on [docker-rutorrent](https://github.com/linuxserver/docker-rutorrent) which sets up a wireguard client and passes all traffic in the container through the VPN connection. Wireguard support is required in the host kernel.

NOTE: The 'privileged' flag is required on the container for everything to work correctly after a recent wireugard update. Otherwise the following error can occur: `sysctl: permission denied on key "net.ipv4.conf.all.src_valid_mark"`. Previously only NET_ADMIN cap was needed.

Wireguard config files are located in the `/etc/wireguard` volume. Mount it to a directory on your host and place all wireguard \*.conf files you wish to use, then specify the config file to use with the environment variable `WG_SERVER`. For example, if the config file is called `myserver.conf`, specify `myserver`.

## Example usage (docker-compose)

```
rutorrent:
  build: {DOCKERFILE_LOCATION_HERE}
  environment:
    - WG_SERVER=myserver
  volumes:
    - /etc/localtime:/etc/localtime:ro
    - ./rutorrent/config:/config
    - ./rutorrent/wireguard:/etc/wireguard
  ports:
    - 80:80/tcp
  privileged: true
  restart: unless-stopped
```
