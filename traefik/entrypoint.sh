#!/bin/sh
envsubst < /etc/traefik/dynamic_config.template.yml > /etc/traefik/dynamic_config.yml
exec traefik "$@"
