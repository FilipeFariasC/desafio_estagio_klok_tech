#!/bin/env bash

folders=$(echo ./desafio_estagio_klok_tech_api_*)

for folder in $folders; do
    cd $folder
    ./mvnw clean package spring-boot:repackage
done;