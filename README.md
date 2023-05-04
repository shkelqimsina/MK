# Django React Starter

Django-React application starter template for easy web application development.

## Get started

Simply follow these steps to get started:

- Fork this repository
- Clone your fork
- Update documentation:
  - Use the `README.example.md` file as a template for your own `README.md` file
  - Use the `CHANGELOG.example.md` file as a template for your own `CHANGELOG.md` file
  - Update the `LICENSE` file
  - Remove `yarn.lock` file
- Update the code:
  - Replace all occurrences of `django_react_starter` with `your_project_name`
  - Replace all occurrences of `django-react-starter` with `your-project-name`
  - Replace all occurrences of `Django React Starter` with `Your Project Name`
- Deployment:
  - Create your own **fly.toml** file using `fly launch` (see [Fly.io](https://fly.io) for more information)
  - Update the GitHub action `deploy.yml` to be triggered on release
- Start coding!

## Features

This starter delivers a fully-working and deployment-ready application
with Django+DRF and React, and comes with many features included.

**A fully working a customizable Django/DRF:**

- Views:
  - Basic Django views for good measures: `ping`, `robots.txt`
  - A default/catch-all route that serves the React frontend (`index` view)
  - Authentication API (`login`, `logout`, `check`)
  - Current user API (`get`, `update`, `update_password`)
- Database:
  - Flexible database management (SQLite or PostgreSQL)
  - A custom user model following best practices
- QA:
  - Configuration files for `isort`, `flake8`, `black`, and `mypy`
  - Fully-tested models and APIs
  - Many utilities through the `jklib` package
- Production:
  - Pre-configured file and stream logging
  - **Sentry** integration
  - Email integration with a pre-configured template and the **Sendinblue** API
  - Includes the `APS (Advanced Python Scheduler)` to schedule tasks within the application
  - Run the application in production using **supervisor**

**A Vite-powered React frontend with Ant Design UI:**

- UI:
  - Fully working auth and user management
  - Uses the **Ant Design** component library with a custom theme
  - Pre-configured layout (header, footer, sidebar, content)
  - Comes with 3 pages: Login, Profile, and Homepage
  - UI notifications and feedbacks on actions
  - Modular CSS with `.less` modules
- Utils:
  - Custom hooks
  - Provide stores with `zustand`
  - Uses the `jkscript` library for various utilities
  - All theme variables are accessible in both `.js` and `.less` files
- QA:
  - Simple and effective `vite` config to work locally with the Django API
  - Configuration files for `eslint`, `prettier`, and `stylelint`
  - Unittest with `jest`
- Production:
  - Served by the Django app (and correctly setup during the docker build)

**Tools for local development:**

- `Dockerfile` to build the final Django image that includes the React frontend
- `docker-compose` file to run the backend and database easily
- `pre-commit` hooks for both backend and frontend

**CI/CD ready to go:**

- QA job that runs linters and tests
- Deployment job that uses the `fly.toml` to deploy to [Fly.io](https://fly.io)
