# homebridge-freebox-home-docker


## Requirement

- An initial homebridge instance with networking_mode host
- Configured config.json with freebox accessories see [this issue](https://github.com/fbx/homebridge-freebox-home/issues/3#issuecomment-658861450)
- Due to freebox API requirement all of the trafic needs to be on localhost
- Add startup.sh into your homebridge directory

## Usage

```yml
freeboxapi:
    image: thomaslacaze/homebridge-freebox-home:1.0.0
    container_name: freeboxAPI
    restart: unless-stopped
    volumes:
        - $PWD/homebridge/config.json:/root/.homebridge/config.json:ro
        - $PWD/freeboxAPI/store:/usr/src/app/src/.store
    network_mode: host

    homebridge:
      container_name: homebridge
      image: oznu/homebridge:3.3.0
      restart: always
      network_mode: host
      environment:
        - TZ=Europe/Paris
        - PGID=1000
        - PUID=1000
        - HOMEBRIDGE_INSECURE=1
      volumes:
        - $PWD/homebridge/:/homebridge
      labels:
        - traefik.enable=false
```
After configuring the config.json with freebox accessories, you need create a token between your freebox and freebox API and give it three permsissions:

PS: token will be stored in 'store' file

```sh
curl http://localhost:8888/api/fbx/auth
```

![Freebox permissions](https://github.com/LacazeThomas/homebridge-freebox-home-docker/raw/main/images/permissions.png)