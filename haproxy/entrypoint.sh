#!/bin/sh
set -e

if [ -z "$PATRONI_HOST_1" ] || [ -z "$PATRONI_HOST_2" ] || [ -z "$PATRONI_HOST_3" ]; then
    echo "Error: PATRONI_HOST_1, PATRONI_HOST_2, and PATRONI_HOST_3 must be set"
    exit 1
fi

envsubst '${PATRONI_HOST_1} ${PATRONI_HOST_2} ${PATRONI_HOST_3}' < /usr/local/etc/haproxy/haproxy.template.cfg > /usr/local/etc/haproxy/haproxy.cfg

exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg
