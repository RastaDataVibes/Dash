#!/bin/bash
set -e

# Export env vars (handled by Render)
export SUPERSET_SECRET_KEY=${SUPERSET_SECRET_KEY}
export SQLALCHEMY_DATABASE_URI=${SQLALCHEMY_DATABASE_URI}

# Upgrade database
superset db upgrade

# Create admin user
superset fab create-admin \
    --username zaga \
    --firstname zaga \
    --lastname dat \
    --email opiobethle@gmail.com \
    --password zagadat || echo "Admin already exists"

# Start server WITHOUT reload and WITHOUT debugger
exec superset run -p ${PORT:-8088} --with-threads --host 0.0.0.0
