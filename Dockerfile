FROM alpine:latest

#update and add the imagemagick binary
RUN apk update && apk add --no-cache imagemagick

#copy the .bmp image to the docker container host
COPY picture.bmp /tmp/Pictures/

#ENTRYPOINT ["sh"]
