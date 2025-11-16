FROM apache/superset:latest-dev

# Set environment variable so Superset can find your config
ENV PYTHONPATH="/app/pythonpath:${PYTHONPATH}"

# Copy custom config
COPY superset_config.py /app/pythonpath/superset_config.py

# Switch to root to copy & chmod startup script
USER root
COPY superset_start.sh /app/superset_start.sh
RUN chmod +x /app/superset_start.sh

# Switch back to superset user
USER superset

# Set entrypoint
ENTRYPOINT ["/app/superset_start.sh"]
