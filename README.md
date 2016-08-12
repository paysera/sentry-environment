# sentry-environment
### Initial setup
##### Create .env file
```bash
echo -e "#postgres\nPOSTGRES_PASSWORD=sentry\nPOSTGRES_USER=sentry\n#sentry\nSENTRY_SECRET_KEY=liglagveumHovMuckWasbajethOcvoyp\nSENTRY_RABBITMQ_HOST=rabbitmq\nSENTRY_REDIS_HOST=redis\nSENTRY_POSTGRES_HOST=postgres\nSENTRY_DB_USER=sentry\nSENTRY_DB_PASSWORD=sentry" > .env
```

### Control
##### Start/restart environment
```bash
./scripts/launch.sh
```
##### Scale
```bash
docker-compose scale sentry-worker=4
```
