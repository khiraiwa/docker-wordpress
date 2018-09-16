From wordpress:php7.2-fpm-alpine

MAINTAINER khiraiwa <the.world.nova@gmail.com>

COPY wp-config.php /wp-config.php
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD ["wordpress"]
