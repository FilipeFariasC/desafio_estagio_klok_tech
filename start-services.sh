#!/bin/env bash

while getopts "m" flag; do
  case "${flag}" in
    m) method=${OPTARG} ;;
  esac
done;

method=$(tr '[:upper:]' '[:lower:]' <<< "$method")
properties_file_path="./src/main/resources/application.properties"

docker_rabbitmq="spring.rabbitmq.addresses = rabbitmq:5672"
localhost_rabbitmq="spring.rabbitmq.addresses = localhost:5672"

docker_postgres="spring.datasource.url=jdbc:postgresql://db-estagio:5432/klok_dev_est_api_1"
localhost_postgres="spring.datasource.url=jdbc:postgresql://localhost:5432/klok_dev_est_api_1"


if[[ "$method" = 'java' ]];
then
    folders=$(echo ./desafio_estagio_klok_tech_api_*)
    for folder in $folders; do
        cd $folder
        sed -i '/^spring.rabbitmq.addresses/d' $properties_file_path
        sed -i 's/# Docker/$localhost_rabbitmq/g' "$properties_file_path"
    done;
done;