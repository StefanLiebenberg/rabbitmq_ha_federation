#!/bin/sh

(sleep 5; setup-federation.sh ) &

exec docker-entrypoint.sh rabbitmq-server "${@}"
