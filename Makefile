NAME = ex_sqs_service
VERSION = build

all: build test lint

build:
	docker build -t $(NAME):$(VERSION) .

test:
	docker run --rm -v `pwd`:/app/ $(NAME):$(VERSION) mix do deps.get, espec --trace

lint:
	docker run --rm -v `pwd`:/app/ $(NAME):$(VERSION) mix do deps.get, dogma, credo

clean:
	docker rmi $(NAME):$(VERSION)
