FROM drupal:10.0

ARG MODULES_NAME
ARG USER_ID
ARG GROUP_ID

RUN userdel -f www-data &&\
    if getent group www-data ; then groupdel www-data; fi
RUN groupadd -g ${GROUP_ID} www-data &&\
    useradd -l -u ${USER_ID} -g www-data www-data
RUN install -d -m 0755 -o www-data -g www-data /home/www-data

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
