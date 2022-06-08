FROM alpine:3.6
RUN apk update && apk add --no-cache curl grep
EXPOSE 53/udp
COPY ./app /app
WORKDIR /app
RUN for i in `cat blocklist.url | sed -r 's/#[^#?]*$//g'`;do (curl -f  $i |  grep '^[0-9a-Z]' | sed 's/0.0.0.0\s*//g' ) >> ./blocklist.txt ; done
RUN chmod +x -R ./
CMD "./script.sh"
