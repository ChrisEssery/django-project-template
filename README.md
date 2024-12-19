# Django Project Template

This is a reusable Django project template, featuring Docker for containerisation and PostgreSQL as the database. It is designed to help you quickly set up a fully containerised Django project.

## Features

- Django (Python 3.11)
- Docker with Docker Compose
- PostgreSQL database integration
- Poetry for dependency management
- Pre-configured files for local development

## Getting Started

### Prerequisites

Before starting, ensure the following tools are installed on your machine:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Poetry](https://python-poetry.org/docs/#installation) (optional if you plan to use Poetry for managing dependencies)

### Installation Steps

1. **Clone the repository**:

   ```bash
   git clone https://github.com/ChrisEssery/django-project-template.git
   cd django-project-template
   ```

2. **Rename the project**:

   Replace all instances of `project_template` with your desired project name. This includes renaming:
   - The outer `project_template` folder
   - The inner Django `project_template` folder
   - Any references in the project files (e.g. Django settings, `docker-compose.yml`, `Dockerfile`, and `pyproject.toml`).

3. **Associate the project to your own Git repository**:

   1. Initialise an empty repository on GitHub (or your preferred Git provider).

   2. Remove the original remote:

   ```bash
   git remote remove origin
   ```

   3. Delete the Git history:

   ```bash
   rm -rf .git
   ```

   4. Re-initialise the Git repository:

   ```bash
   git init
   ```

   5. Prepare the project for commit:

   ```bash
   git add .
   ```

   6. Commit the project:

   ```bash
   git commit -m "Initial commit"
   ```

   7. Add your new remote:

   ```bash
   git remote add origin <your-repository-url>
   ```

   8. Push the project to your new remote:

   ```bash
   git push -u origin main
   ```

4. **Build the Docker containers**:

   Once the project has been renamed, build the Docker containers using the following command:

   ```bash
   docker-compose build
   ```

5. **Run the containers**:

   Launch the Django and PostgreSQL containers:

   ```bash
   docker-compose up
   ```

6. **Access the application**:

   Open `http://localhost:8000` in your browser to view your Django app. The admin panel is accessible at `http://localhost:8000/admin`.

## Project Structure

- **docker/**: Contains Docker-related files, including the `Dockerfile` and `entrypoint.sh`, which performs database migrations, optionally collects static files, creates a superuser and starts the development server.
- **project_template/**: The main Django project folder, which should be renamed to match your project’s name.
- **docker-compose.yml**: Docker Compose configuration for managing the containers (Django, PostgreSQL).
- **pyproject.toml**: Poetry dependency management file, including Django 5.1.1 and `psycopg2-binary` for PostgreSQL integration.
- **poetry.lock**: Automatically generated lock file to ensure consistent dependency versions.

## Environment Configuration

Ensure you configure your environment variables in a `.env` file or directly within `docker-compose.yml`, especially for sensitive information such as database credentials and secret keys.
