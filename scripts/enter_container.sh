#!/bin/bash

if [ -f ../.env ]; then
  source ../.env;
fi

docker exec --user www-data -it $DRUPAL_CONTAINER_NAME bash
