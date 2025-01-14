#!/bin/bash

set -e

# Wait for Postgres to start
python wait_for_db.py "run-app"

# Choose settings
if [[ "$RUN_AS_DEV_SERVER" == 1 ]]; then
  SETTINGS=MK.settings.development
else
  SETTINGS=MK.settings.production
fi

# Setup the app
python manage.py collectstatic --noinput --settings=$SETTINGS
python manage.py migrate --settings=$SETTINGS
python manage.py createsu --settings=$SETTINGS

# Run the app
if [[ "$RUN_AS_DEV_SERVER" == 1 ]]; then
  echo "[run-app] Running app in development mode"
  python manage.py runserver 0.0.0.0:8000 --settings=$SETTINGS
else
  echo "[run-app] Running app in production mode"
  gunicorn MK.wsgi:application \
    --bind=:${PORT:-8000} \
    --workers=${GUNICORN_WORKERS:-4}
fi
