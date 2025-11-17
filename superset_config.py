import os
from datetime import timedelta

# Secret key for session encryption
SECRET_KEY = os.environ.get("SUPERSET_SECRET_KEY", "please-change-this-secret-key")

SQLALCHEMY_DATABASE_URI = os.environ.get("SQLALCHEMY_DATABASE_URI", "sqlite:////app/superset_home/superset.db")

# Make sessions permanent
SESSION_PERMANENT = True

# Very long session lifetime (effectively "always logged in")
PERMANENT_SESSION_LIFETIME = timedelta(days=3650)  # 10 years

# Optional: Disable SQLAlchemy event system warnings
SQLALCHEMY_TRACK_MODIFICATIONS = False
