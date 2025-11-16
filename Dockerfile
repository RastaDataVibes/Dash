FROM apache/superset:latest-dev

# Copy your custom config
COPY superset_config.py /app/pythonpath/superset_config.py
