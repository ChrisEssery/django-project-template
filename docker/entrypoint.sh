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

# Create or update superuser
echo "Creating/updating superuser..."
python manage.py shell << EOF
from django.contrib.auth import get_user_model
User = get_user_model()
try:
    user = User.objects.get(username='$SUPERUSER_USERNAME')
    print('Superuser already exists, updating...')
except User.DoesNotExist:
    user = User.objects.create_superuser('$SUPERUSER_USERNAME', '$SUPERUSER_EMAIL', '$SUPERUSER_PASSWORD')
    print('Superuser created successfully')
user.email = '$SUPERUSER_EMAIL'
user.set_password('$SUPERUSER_PASSWORD')
user.save()
EOF

# Start Django development server
python manage.py runserver 0.0.0.0:8000
