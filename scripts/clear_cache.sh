#!/bin/bash

if [ -f ../.env ]; then
  source ../.env;
fi

docker exec -w /opt/drupal -it $DRUPAL_CONTAINER_NAME  bash -c "drush cr"
