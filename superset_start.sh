#!/bin/bash
# Exit immediately if a command fails
set -e

# Set environment variables
export SUPERSET_SECRET_KEY=${SUPERSET_SECRET_KEY}
export SQLALCHEMY_DATABASE_URI=${SQLALCHEMY_DATABASE_URI}

# Initialize the database
superset db upgrade

# Create admin user if not exists
superset fab create-admin \
    --username zaga \
    --firstname zaga \
    --lastname dat \
    --email opiobethle@gmail.com \
    --password zagadat || echo "Admin user may already exist, skipping..."

# Initialize Superset
superset init

# Start Superset web server
exec superset run -p ${PORT:-8088} --with-threads --reload --debugger --host 0.0.0.0

