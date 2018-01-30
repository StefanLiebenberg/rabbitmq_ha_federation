#!/bin/bash

set -e


./setup-downstream.sh rabbit-downstream-1
./setup-downstream.sh rabbit-downstream-2

# install pika
# docker-compose run --rm admin pip install pika --user

#chromium http://$(docker-compose port rabbit-upstream-alt 15672) \
#         http://$(docker-compose port rabbit-downstream-1 15672) \
#         http://$(docker-compose port rabbit-downstream-2 15672);
