FROM alpine:3.6
COPY ./app /app
WORKDIR /app
EXPOSE 2053/udp
RUN apk update && apk add --no-cache curl
RUN for i in `cat blocklist.url | sed -r 's/#[^#?]*$//g'`;do (curl -f  $i | grep -v '^[0-9a-Z]' | sed 's/0.0.0.0\s*//g' ) >> ./blocklist.txt ; done
RUN chmod +x -R ./
RUN cat /etc/hosts && sh replace.sh
RUN head ./dcompass.yaml
CMD ./dcompass -c ./dcompass.yaml
