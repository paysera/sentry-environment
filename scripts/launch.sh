#!/usr/bin/env bash

# Config
GIT_BIN_DIRECTORY=/usr/bin
DOCKER_BIN_DIRECTORY=/usr/bin
DOCKER_COMPOSER_BIN_DIRECTORY=/usr/local/bin
INSTALL_SENTRY_PLUGINS=false

# Load local config
if [ -e ".local" ]; then
    source .local
fi

# Run
${GIT_BIN_DIRECTORY}/git pull
${DOCKER_COMPOSER_BIN_DIRECTORY}/docker-compose up -d --force-recreate

#https://docs.docker.com/compose/startup-order/
sleep 3

# Install sentry jira plugin
if [ ${INSTALL_SENTRY_PLUGINS} = true ]; then
    ${DOCKER_BIN_DIRECTORY}/docker exec -it sentryenvironment_sentry_1 pip install sentry-plugins
    ${DOCKER_COMPOSER_BIN_DIRECTORY}/docker-compose restart
fi

${DOCKER_BIN_DIRECTORY}/docker exec -it sentryenvironment_sentry_1 sentry upgrade
