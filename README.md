# Enable-Uptime - monitor site uptime easily via email
## API
All API is described using OpenAPI 3, json is avaliable at `/api/swagger_doc.json`

Also, Swagger interface can be found at `api/docs`

## Deployment
We don't have prebuild images yet, but building it yourself is pretty simple)

1. `git clone git@github.com:egor-khanko/enable-uptime.git`
2. `cp .env.sample .env`
3. Edit `.env` file to match your environment
4. `docker-compose up` (or `docker-compose up -d` to run in the background)

Logs are located at production.log, it is accesible only inside docker container,
but in prod app should be monitored through some king of tracking tool (NewRelic, Sentry, etc.)
