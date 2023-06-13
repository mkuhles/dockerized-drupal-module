#!/bin/bash

if [ -f ../.env ]; then
  source ../.env;
fi
DB_URL="mysql://$MARIADB_USER:$MARIADB_PASSWORD@$DATABASE_CONTAINER_NAME:$DATABASE_PORT/$MARIADB_DATABASE"
sleep 5

docker exec -w /opt/drupal $DRUPAL_CONTAINER_NAME bash -c "composer require drush/drush ; composer update"

echo '' 
echo -e "Install drupal on the container:\n"

docker exec -w /opt/drupal $DRUPAL_CONTAINER_NAME drush si --db-url=$DB_URL --account-pass=$DRUPAL_ADMIN_PASS --site-name="$SITE_NAME" -y

docker exec $DRUPAL_CONTAINER_NAME chown www-data:www-data /opt/drupal/web/sites/default/files -R

docker exec -it $DRUPAL_CONTAINER_NAME  bash -c "drush generate module --answer=$MODULES_NAME --answer=$MODULES_NAME"

docker exec -it --user root $DRUPAL_CONTAINER_NAME  bash -c "chown $(id -u):$(id -g) $MODULES_NAME.info.yml"
docker exec -it --user root $DRUPAL_CONTAINER_NAME  bash -c "if test -f $MODULES_NAME.install; then chown $(id -u):$(id -g) $MODULES_NAME.install; fi"
docker exec -it --user root $DRUPAL_CONTAINER_NAME  bash -c "if test -f $MODULES_NAME.module; then chown $(id -u):$(id -g) $MODULES_NAME.module; fi"
docker exec -it --user root $DRUPAL_CONTAINER_NAME  bash -c "if test -f README.md; then chown $(id -u):$(id -g) README.md; fi"

echo -e "\nCall 'composer init' for creating a composer.json file.\n"
