# sentry-environment

## Initial setup

### Create .env file
```bash
echo -e "#docker-compose\nCOMPOSE_PROJECT_NAME=sentryenvironment\n#postgres\nPOSTGRES_PASSWORD=sentry\nPOSTGRES_USER=sentry\n#sentry\nSENTRY_SECRET_KEY=liglagveumHovMuckWasbajethOcvoyp\nSENTRY_RABBITMQ_HOST=rabbitmq\nSENTRY_REDIS_HOST=redis\nSENTRY_POSTGRES_HOST=postgres\nSENTRY_DB_USER=sentry\nSENTRY_DB_PASSWORD=sentry" > .env
```

### Control

#### Start/restart environment
```bash
./scripts/launch.sh
```
#### Scale
```bash
docker-compose scale sentry-worker=4
```

## Upgrade

Make sure to read upgrade guides before doing migration. It may have breaking changes

```
docker-compose stop sentry
```

Increase image version in docker-compose for `sentry`

```
docker-compose up -d --force-recreate sentry
docker-compose exec sentry sentry upgrade
docker-compose stop sentry-cron sentry-worker
```
Increase image version in docker-compose for `sentry-cron`, `sentry-worker`

```
docker-compose up -d --force-recreate sentry-cron sentry-worker
docker-compose restart
```
