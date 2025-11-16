FROM apache/superset:latest-dev

# Copy your custom config
COPY superset_config.py /app/pythonpath/superset_config.py

# Copy a startup script into the image
COPY superset_start.sh /app/superset_start.sh
RUN chmod +x /app/superset_start.sh

# Make the startup script the container entrypoint
ENTRYPOINT ["/app/superset_start.sh"]
