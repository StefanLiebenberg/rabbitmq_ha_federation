#!/bin/sh

(sleep 5; setup-federation.sh ) &

eval rabbitmq-server "${@}"
