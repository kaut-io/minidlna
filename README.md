This is a fork from https://github.com/whatever4711/minidlna

# Minidlna in a Container

Currently, this is a docker image based on Alpine to server minidlna.

## Supported Architectures

This multiarch image supports `amd64`, `arm32v6`, `arm64v8` on Linux

## Starting the Container
`docker container run -d --name minidlna --privileged --network host whatever4711/minidlna`
Thereafter you can access picapport on http://localhost:8080

## Deploying with Docker-compose

After creating and modifying the following `docker-compose.yml`, just call `docker-compose up -d`

```[docker-compose.yml]
version: '3'

volumes:
  db:
  media:

services:
  audio:
    image: whatever4711/minidlna
    restart: always
    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - media:/media
      - db:/var/cache/minidlna
    network_mode: host
```
