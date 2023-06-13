#!/bin/bash

if [ -f ../.env ]; then
  source ../.env;
fi

docker exec -it $DRUPAL_CONTAINER_NAME bash
