FROM postgres:11

COPY ./buildfiles/postgres.sql /docker-entrypoint-initdb.d/postgres.sql
COPY ./buildfiles/start.sh /start.sh

COPY ./sharpnet/nginx.conf /sharpnet/nginx.conf

RUN chmod +x /start.sh
RUN chmod -R 777 /sharpnet

# try and find file docker-entrypoint.sh
RUN find . -name docker-entrypoint.sh

# Add user postgres
RUN useradd -ms /bin/bash postgres
CMD ["/start.sh"]