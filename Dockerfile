FROM alpine:3.6
COPY ./app /app
WORKDIR /app
EXPOSE 53/udp
RUN apk update && apk add --no-cache curl
RUN for i in `cat blocklist.url | sed -r 's/#[^#?]*$//g'`;do (curl -f  $i | grep -v '^[0-9a-Z]' | sed 's/0.0.0.0\s*//g' ) >> ./blocklist.txt ; done
CMD ./dcompass -c ./dcompass.yaml
