FROM alpine:3.6
COPY ./app /app
WORKDIR /app
RUN chmod +x dcompass
EXPOSE 53/udp
CMD ./dcompass -c ./config.yaml
