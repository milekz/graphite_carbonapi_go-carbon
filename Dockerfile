FROM alpine

RUN apk update && apk add bash git go make cairo-dev pkgconfig supervisor && \
git clone https://github.com/lomik/go-carbon.git && \
git clone https://github.com/go-graphite/carbonapi.git && \ 
cd go-carbon  && \
make && \
cp go-carbon /usr/bin && \
cd .. && \
cd carbonapi && \
make && \
make install && \
mkdir -p /var/lib/graphite/whisper && \
mkdir -p /etc/go-carbon && mkdir -p /etc/carbonapi && \
apk del git go make cairo-dev pkgconfig gcc && \
adduser -D carbon && rm -rf /tmp/* /var/cache/apk/* 

COPY carbonapi.yml /etc/carbonapi/
COPY *.conf /etc/go-carbon/

