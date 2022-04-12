#!/bin/bash

set -e

echo $(psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" << sql-code
CREATE USER IF NOT EXISTS klok_dev_est;

CREATE DATABASE klok_dev_est_api_1;
CREATE DATABASE klok_dev_est_api_2;

GRANT ALL PRIVILEGES ON DATABASE klok_dev_est_api_1 TO klok_dev_est;
GRANT ALL PRIVIELEGES ON DATABASE klok_dev_est_api_2 TO klok_dev_est;

SELECT * FROM pg_database;

sql-code
)
