FROM alpine

RUN apk update && apk add bash git curl wget go make cairo-dev pkgconfig %% \
git clone https://github.com/lomik/go-carbon.git && \
git clone https://github.com/go-graphite/carbonapi.git && \ 
cd go-carbon  && \
make && \
cp go-carbon /usr/bin && \
cd .. && \
cd carbonapi && \
make && \
make install && \
