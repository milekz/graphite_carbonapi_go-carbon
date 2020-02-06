FROM alpine

RUN apk update && apk add bash git go make cairo-dev pkgconfig supervisor && \
git clone https://github.com/lomik/go-carbon.git && \
git clone https://github.com/go-graphite/carbonapi.git && \ 
cd go-carbon  && \
make && \
cp go-carbon /usr/bin && \
make clean && \
cd .. && \
cd carbonapi && \
make && \
make install && \
make clean && \
mkdir -p /var/lib/graphite/whisper && \
mkdir -p /etc/go-carbon && \
mkdir -p /etc/carbonapi && \
mkdir -p /etc/supervisor/conf.d && \
apk del git go make pkgconfig gcc && \
adduser -D carbon && rm -rf /tmp/* /var/cache/apk/* 

COPY carbonapi.yml /etc/carbonapi/
COPY *.conf /etc/go-carbon/
COPY supervisord /etc/supervisord.conf

VOLUME ["/var/lib/graphite/whisper" ] 

EXPOSE 8081 2003 2003/udp 2004

CMD supervisord -c /etc/supervisord.conf
