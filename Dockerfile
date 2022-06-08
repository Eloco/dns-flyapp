FROM alpine:3.6
RUN apk update && apk add --no-cache wget 
EXPOSE 53/udp
COPY ./app /app
WORKDIR /app
RUN wget https://raw.githubusercontent.com/Eloco/hosts/main/blocklist.txt -O blocklist.txt
RUN chmod +x -R ./
CMD "./script.sh"
