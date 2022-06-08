FROM alpine:3.6
RUN apk update && apk add --no-cache curl
EXPOSE 53/udp
COPY ./app /app
WORKDIR /app
RUN curl https://raw.githubusercontent.com/Eloco/hosts/main/blocklist.txt -o blocklist.txt
RUN chmod +x -R ./
CMD "./script.sh"
