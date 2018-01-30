build: 
	docker build -t slieb/federated-rabbitmq federated

push: build
	docker push slieb/federated-rabbitmq
