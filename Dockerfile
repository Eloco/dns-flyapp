FROM ghcr.io/linuxserver/baseimage-ubuntu:focal
COPY ./app /app
WORKDIR /app
RUN chmod +x dcompass
EXPOSE 53/udp
CMD ./dcompass -c ./config.yaml
