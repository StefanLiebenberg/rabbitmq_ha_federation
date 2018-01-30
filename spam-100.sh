#!/usr/bin/env bash


for i in {001..100}; do
  docker-compose exec rabbit-upstream-alt rabbitmqadmin publish exchange=custom.FooExchange \
      payload="hello,  world $i" routing_key=""
done
