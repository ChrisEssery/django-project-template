#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Run database migrations
echo "Running database migrations..."
python manage.py migrate

# Collect static files (uncomment if needed)
# echo "Collecting static files..."
# python manage.py collectstatic --noinput

# Default superuser credentials
SUPERUSER_USERNAME="admin"
SUPERUSER_EMAIL="admin@example.com"
SUPERUSER_PASSWORD="supersecretpassword"

# Create superuser
echo "Creating superuser..."
python manage.py createsuperuser --noinput \
  --username "$SUPERUSER_USERNAME" \
  --email "$SUPERUSER_EMAIL" || echo "Superuser already exists or failed to create"

# Use Django shell to set the password
echo "Setting superuser password..."
echo "from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(username='$SUPERUSER_USERNAME'); user.set_password('$SUPERUSER_PASSWORD'); user.save()" | python manage.py shell

# Start Django development server
python manage.py runserver 0.0.0.0:8000
