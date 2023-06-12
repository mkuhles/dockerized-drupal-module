FROM drupal:10.0

ARG MODULES_NAME

RUN apt-get update
RUN apt-get install vim -y

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush

# Clean repository
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /opt/drupal/web/modules/${MODULES_NAME}

EXPOSE 8080

