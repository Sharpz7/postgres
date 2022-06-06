FROM postgres:11

COPY ./buildfiles/postgres.sql /docker-entrypoint-initdb.d/postgres.sql
COPY ./buildfiles/start.sh /start.sh

COPY ./sharpnet/nginx.conf /sharpnet/nginx.conf

RUN chmod +x /start.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/start.sh"]