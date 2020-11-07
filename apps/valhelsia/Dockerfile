FROM alpine
RUN apk add dumb-init openjdk8-jre
RUN wget -O /minecraft.zip 'https://media.forgecdn.net/files/2914/912/Valhelsia_SERVER-1.2.1.zip'
ADD launchwrapper.sh /launchwrapper.sh
WORKDIR /minecraft
ENTRYPOINT ["dumb-init"]
CMD ["/launchwrapper.sh"]
