
FROM rust:latest AS builder
WORKDIR /usr/src/webdocker
COPY . .
RUN cargo install --path .
 
FROM debian:buster-slim
RUN apt-get update && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/webdocker /usr/local/bin/webdocker
#export this actix web service to port 8080 and 0.0.0.0
EXPOSE 8080
CMD ["webdocker"]
