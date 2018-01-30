FROM rabbitmq:3.6-management-alpine
COPY init.sh setup-federation.sh /usr/local/bin/
RUN  chmod +x /usr/local/bin/init.sh /usr/local/bin/setup-federation.sh
RUN  rabbitmq-plugins enable --offline rabbitmq_federation rabbitmq_federation_management
CMD ["init.sh"]
EXPOSE 4369 5672 15672
