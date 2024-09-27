#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Run database migrations
echo "Running database migrations..."
python manage.py migrate

# Collect static files
#echo "Collecting static files..."
#python manage.py collectstatic --noinput

# Start Django development server
python manage.py runserver 0.0.0.0:8000
