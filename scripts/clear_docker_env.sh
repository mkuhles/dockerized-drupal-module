#!/bin/bash

docker stop drupal10
docker stop database

docker rm drupal10
docker rm database

docker volume rm drupal10_db-data
docker volume rm drupal10_drupal-sites
docker volume prune -f

docker image rm drupal10-drupal
docker image rm mariadb
