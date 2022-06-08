FROM alpine:3.6
RUN apk update && apk add --no-cache curl
EXPOSE 53/udp
COPY ./app /app
WORKDIR /app
RUN for i in `cat blocklist.url | sed -r 's/#[^#?]*$//g'`;do (curl -f  $i | sed 's/^[^0-9a-Z].*//g' | grep  -v '^$' | sed 's/0.0.0.0\s*//g' ) >> ./blocklist.txt ; done
RUN chmod +x -R ./
CMD "./script.sh"
