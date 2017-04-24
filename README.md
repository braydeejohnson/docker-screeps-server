# screeps-server
Docker images for running a containerized [screeps private server](https://github.com/screeps/screeps).

The source for the containers can be found on [Github](https://github.com/braydeejohnson/docker-screeps-server)

The container builds can be found on [Docker Hub](https://hub.docker.com/r/braydeejohnson/screeps-server/)


# Screeps
[Screeps](https://screeps.com) is a MMO RTS sandbox game for programmers, wherein the core mechanic is programming your units AI. You control your colony by writing JavaScript which operate 24/7 in the single persistent world filled by other players on par with you.

This project is a distributed, standalone game server that allows you to launch your own game world on a local computer or dedicated server on the Internet.

## Create Container
The screeps-server requires the Steam API key in order to complete authentication. API key is available at [Steam for Developers](http://steamcommunity.com/dev/apikey).

The API Key will be passed as an environment variable: `STEAM_KEY`
````
docker run -d \
-e STEAM_KEY='apikeyfromsteam' \
braydeejohnson/screeps-server:<version>
````

## Server versions available by tag
Omitting a version when running the `docker run` command will use the latest version 
* 2.5.x (latest)
* 2.4.x
* 2.3.x
* 2.2.x

Currently there is no automated watch in place to rebuild the docker image when the screeps private server increments a minor version release.

## Running CLI
To connect with CLI to the running container use the following:
````
docker exec <container-id> screeps cli
````
Once connected you may issue commands based on the [CLI Section](https://github.com/screeps/screeps#command-line-interface-cli) documented on GitHub.

## Volumes
You may volume mount to `/screeps` to access/share files with your host as well as add mods/bots to the server.

## Ports
* `21025`: Client Connections
* `21026`: CLI Connections