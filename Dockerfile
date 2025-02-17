FROM node:20.11.1 as app-react-image

WORKDIR /front
ADD ./frontend /front
RUN yarn install && yarn build

FROM python:3.12.0-slim

# Python environment variables
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1

# Update OS
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    supervisor \
    nano \
    gdal-bin \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY ./backend/requirements.txt ./backend/requirements-dev.txt /tmp/
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r /tmp/requirements.txt -r /tmp/requirements-dev.txt \
    && rm -rf /tmp/requirments.txt /tmp/requirments-dev.txt

# Create dir and user
RUN mkdir -p /home/app/backend && mkdir -p /home/app/frontend && mkdir -p /home/app/logs
RUN addgroup --system app && adduser --system --group app
WORKDIR /home/app

# Copy backend and frontend, then set frontend within backend with a symlink
COPY ./backend ./backend
COPY --chown=app:app --from=app-react-image /front/dist /home/app/frontend/dist
RUN ln -sf /home/app/frontend /home/app/backend/frontend

# Change ownership
RUN chown -R app:app /home/app
#USER app

# Run the app
EXPOSE 8000
CMD supervisord -c ./backend/supervisord.conf
