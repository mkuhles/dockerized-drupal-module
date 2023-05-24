#!/bin/bash

./clear_docker_env.sh
docker compose up -d
./init.sh
