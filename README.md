# docker-mosquitto

A custom docker image for [eclispe mosquitto](https://mosquitto.org/), based on the [docker official image](https://hub.docker.com/_/eclipse-mosquitto).

# feature

- an opinionated default [mosquitto.conf](./mosquitto.conf)

- set [mosquitto.conf](https://mosquitto.org/man/mosquitto-conf-5.html) through environment variables

  To set a parameter, prefix it with **MSQT\_** and pass it as uppercase environment variable when running a container. For example, `MSQT_MAX_INFLIGHT_MESSAGES=100` sets `max_inflight_messages` to `100`.

# example

```
docker run --rm --name mqtt -p 1883:1883 -e MSQT_ALLOW_ANONYMOUS=false -e MSQT_AUTO_ID_PREFIX=foo loivis/mosquitto:2.0.15
```
