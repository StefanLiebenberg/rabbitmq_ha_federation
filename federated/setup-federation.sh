#!/bin/sh


export ARRAY_CONTENTS="[ \"${RABBITMQ_FEDERATED_URI}\" ]"

config="{\"max-hops\": 1, \"uri\": ${ARRAY_CONTENTS}}";
docker-entrypoint.sh rabbitmqctl set_parameter federation-upstream upstream "${config}"

config='[{"upstream": "upstream"}]'
docker-entrypoint.sh rabbitmqctl set_parameter federation-upstream-set upstream_federators "${config}"

config='{"federation-upstream-set": "upstream_federators"}'
docker-entrypoint.sh rabbitmqctl set_policy --apply-to exchanges federation_policy ".*" "${config}"
