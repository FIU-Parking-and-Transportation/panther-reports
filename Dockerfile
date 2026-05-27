FROM docker.io/lovasoa/sqlpage

COPY source/ /var/www/
COPY configuration/migrations/ /etc/sqlpage/migrations/
