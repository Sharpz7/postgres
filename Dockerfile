FROM postgres:14.3

COPY ./buildfiles/postgres.sql /docker-entrypoint-initdb.d/postgres.sql
COPY ./buildfiles/start.sh /start.sh

COPY ./sharpnet/nginx.conf /sharpnet/nginx.conf

RUN chmod +x /start.sh
RUN chmod -R 777 /sharpnet

USER postgres
CMD ["/start.sh", "postgres"]