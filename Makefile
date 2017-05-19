all: build

build:
	@docker build --tag=smartchecker/ubuntu:latest .

release: build
	@docker build --tag=smartchecker/ubuntu:$(shell cat VERSION) .
