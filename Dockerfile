FROM golang:1.27.3 AS gosu-builder
WORKDIR /src
RUN git init && git remote add origin https://github.com/tianon/gosu.git && git fetch --depth=1 origin 6456aaa0f3c854d199d0f037f068eb97515b7513 && git checkout FETCH_HEAD && CGO_ENABLED=0 go build -trimpath -o /gosu .

FROM postgres:17-trixie
COPY --from=gosu-builder /gosu /usr/local/bin/gosu

COPY ./buildfiles/postgres.sql /docker-entrypoint-initdb.d/postgres.sql
COPY ./buildfiles/start.sh /start.sh

COPY ./sharpnet/nginx.conf /sharpnet/nginx.conf

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends ca-certificates && rm -rf /var/lib/apt/lists/*
RUN sed -i -e 's|^mozilla/emSign_ECC_Root_CA_-_G3.crt|!&|' -e 's|^mozilla/Comodo_AAA_Services_root.crt|!&|' /etc/ca-certificates.conf && update-ca-certificates
RUN chmod +x /start.sh
RUN chmod -R 755 /sharpnet


CMD ["/start.sh"]