FROM php:5.6-cli

RUN apt-get update \
  && apt-get install -y git-core libzip-dev

RUN mkdir /opt \
  && cd /opt \
  && git clone https://github.com/liubin/gitlab-jira-integration gj

WORK_DIR /opt/gj

RUN curl -sS https://getcomposer.org/installer | php \
  && docker-php-ext-install zip mbstring \
  && php composer.phar install

EXPOSE 9000

CMD ["php artisan serve --host 0.0.0.0 --port 9000"]
