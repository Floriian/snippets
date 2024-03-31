#!/bin/bash

mkdir docker
cd docker

echo "version: '3.8'

services:
  dev-database:
    image: postgres:latest
    ports:
      - 5432:5432
    env_file:
      - .env.development" > docker-compose.yml

echo 'POSTGRES_PASSWORD="CHANGE_ME"
POSTGRES_USER="CHANGE_ME"
POSTGRES_DB="CHANGE_ME"' > .env.development

cd ..

echo '#!/usr/bin/env bash
cd docker
export COMPOSE_PROJECT_NAME="CHANGE_ME"
docker compose up -d
cd ..
' > start-database.sh
