#!/usr/bin/env bash


for i in {001..100}; do
  docker-compose exec rabbit-upstream rabbitmqadmin publish exchange=federated.FooExchange \
      payload="hello,  world $i" routing_key=""
done
