#.PHONY: all
all: build

build:
	docker build -t haltu/env-tulip:latest .
shell:
	docker run --rm -i -t -v `pwd`:/home/foo/foo haltu/env-tulip
clean:
	docker rmi haltu/env-tulip

