FROM postgres:11

COPY ./buildfiles/postgres.sql /docker-entrypoint-initdb.d/postgres.sql

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]