#!/bin/bash

if [ -f ../.env ]; then
  source ../.env;
fi
DB_URL="mysql://$MARIADB_USER:$MARIADB_PASSWORD@$DATABASE_CONTAINER_NAME:$DATABASE_PORT/$MARIADB_DATABASE"
sleep 5

echo '' 
echo 'install drupal on container' 

docker exec $DRUPAL_CONTAINER_NAME drush si --db-url=$DB_URL --account-pass=$DRUPAL_ADMIN_PASS --site-name="$SITE_NAME" -y

docker exec $DRUPAL_CONTAINER_NAME chown www-data:www-data /opt/drupal/web/sites/default/files -R
