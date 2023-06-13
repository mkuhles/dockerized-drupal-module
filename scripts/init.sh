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

echo 'You have to change the owner from the generated files on your host system. By now it is root.'
echo "> sudo chown $USER:$(id -gn) $MODULES_NAME.info.yml"
echo "> sudo chown $USER:$(id -gn) $MODULES_NAME.install"
echo -e "> sudo chown $USER:$(id -gn) $MODULES_NAME.module\n"
echo -e "Call 'composer init' for creating a composer.json file.\n"
