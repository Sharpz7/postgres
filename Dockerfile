FROM postgres:11

COPY ./buildfiles/postgres.sql /docker-entrypoint-initdb.d/postgres.sql
COPY ./sharpnet/nginx.conf /sharpnet/nginx.conf

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]