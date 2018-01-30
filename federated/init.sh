#!/bin/sh

set -e

(sleep 5; setup-federation.sh ) &

exec docker-entrypoint.sh rabbitmq-server "${@}"
