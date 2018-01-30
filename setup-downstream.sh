#!/usr/bin/env bash

export CONTAINER=${1}
#export UPSTREAM_URI=${2:-"amqp://guest:guest@rabbit-upstream"}
#
#config="{\"max-hops\": 1, \"uri\": [\"${UPSTREAM_URI}\"]}"
#docker-compose exec ${CONTAINER} rabbitmqctl set_parameter federation-upstream upstream "${config}"
#
#config='[{"upstream": "upstream"}]'
#docker-compose exec ${CONTAINER} rabbitmqctl set_parameter federation-upstream-set upstream_federators "${config}"
#
#config='{"federation-upstream-set": "upstream_federators"}'
#docker-compose exec ${CONTAINER} rabbitmqctl set_policy --apply-to exchanges federation_test ".*" "${config}"

#config='{"ha-mode": "all"}'
#docker-compose exec ${CONTAINER} rabbitmqctl set_policy ha-federation "^federation:*" "${config}"

export EXCHANGE=custom.FooExchange;
export QUEUE=custom.FooQueue

docker-compose exec ${CONTAINER} rabbitmqadmin declare exchange name=${EXCHANGE} type=topic
docker-compose exec ${CONTAINER} rabbitmqadmin declare queue name=${QUEUE} durable=false
docker-compose exec ${CONTAINER} rabbitmqadmin declare binding \
    source=${EXCHANGE} \
    destination_type="queue"       \
    destination=${QUEUE};
