FROM drupal:10.0

RUN apt-get update
RUN apt-get install vim -y

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    ln -s /root/.composer/vendor/bin/drush /usr/local/bin/drush

# Install Drush
RUN composer global require drush/drush && \
    composer global update

# Clean repository
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# RUN composer install

#WORKDIR /opt/drupal/web/modules/module_in_development
WORKDIR /opt/drupal/web

EXPOSE 8080

