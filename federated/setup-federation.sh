#!/bin/sh


set -e

export CMD="docker-entrypoint.sh rabbitmqctl"
export PATTERN=${RABBITMQ_FEDERATED_PATTERN:-".*"}
export URI=${RABBITMQ_FEDERATED_URI}

${CMD} set_parameter federation-upstream upstream \
    "{\"max-hops\": 1, \"uri\": \"${URI}\" }"

${CMD} set_parameter federation-upstream-set upstream_federators \
        '[{"upstream": "upstream" }]'

${CMD} set_policy --apply-to exchanges     federation_policy ${PATTERN} \
    '{"federation-upstream-set": "upstream_federators"}'
