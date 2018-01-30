# Federation Docker image


*docker-compose.yml:*


    version: '3'
    services:
      rabbit-upstream:
        image: rabbitmq:3-management-alpine
        hostname: rabbit-upstream
        ports:
        - 4369
        - 5672
        - 15672

      rabbit-downstream:
        build: ./federated
        hostname: rabbit-downstream-1
        environment:
        - RABBITMQ_FEDERATED_URI=amqp://guest:guest@rabbit-upstream
        - RABBITMQ_FEDERATED_PATTERN=".*"
        ports:
        - 4369
        - 5672
        - 15672
