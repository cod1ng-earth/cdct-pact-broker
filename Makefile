
include ./hack/help.mk

UID:=$(shell id -u)
GID:=$(shell id -g)
PWD:=$(shell pwd)
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Linux)
	OS="LINUX"
	OPEN=x-www-browser
endif
ifeq ($(UNAME_S),Darwin)
	OS="OSX"
	OPEN=open
endif


CLI = docker-compose exec -T cli


.PHONY: setup
setup:##@setup Create dev enviroment
	./hack/osx-loopback-address.sh 127.0.0.43
	docker-compose up -d;


.PHONY: open
open: ##@dev open in browser
	$(OPEN) http://127.0.0.43

