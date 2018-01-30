FROM rabbitmq:3.6-management-alpine
EXPOSE 4369 5672 15672

RUN rabbitmq-plugins enable --offline rabbitmq_federation rabbitmq_federation_management

COPY init.sh /usr/local/bin
COPY setup-federation.sh /usr/local/bin
COPY to-array-string.sh /usr/local/bin
RUN  chmod +x /usr/local/bin/init.sh /usr/local/bin/setup-federation.sh /usr/local/bin/to-array-string.sh

CMD ["init.sh"]
