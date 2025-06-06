install:
	cargo clean &&\
		cargo build -j 1

build:
	docker build -t fruit .

rundocker:
	docker run -it --rm -p 8080:8080 fruit

format:
	cargo fmt

lint:
	cargo clippy

test:
	cargo test

run:
	cargo run 

all: format lint test run