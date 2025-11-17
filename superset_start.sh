#!/bin/bash
set -e

echo "🔧 Cleaning up leftover SQLite metadata files..."
rm -f /app/superset.db
rm -f /app/instance/superset.db
rm -f superset.db

echo "🔧 Using SQLALCHEMY_DATABASE_URI: $SQLALCHEMY_DATABASE_URI"

# Initialize / upgrade metadata DB (Neon)
superset db upgrade

# Create admin user if not exists
superset fab create-admin \
    --username zaga \
    --firstname zaga \
    --lastname dat \
    --email opiobethle@gmail.com \
    --password zagadat || true

# Initialize Superset (roles, permissions, etc.)
superset init

echo "🚀 Starting Superset..."
exec superset run -p ${PORT:-8088} --with-threads --host 0.0.0.0
