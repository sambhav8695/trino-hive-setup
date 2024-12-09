#!/bin/bash

echo "running docker-init.sh"

# db upgrade
echo "db upgrade"
superset db upgrade

# create admin user
echo "create admin user"
superset fab create-admin \
    --username admin \
    --firstname Superset \
    --lastname Admin \
    --email admin@superset.com \
    --password admin

# setup roles
echo "setup roles"
superset init

# existing
echo "completed docker-init.sh"
