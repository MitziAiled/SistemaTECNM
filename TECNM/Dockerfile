FROM mysql:latest

ENV MYSQL_DATABASE="tecnmmvc"
ENV MYSQL_ROOT_PASSWORD="root"

COPY ../script.sql /docker-entrypoint-initdb.d/script.sql