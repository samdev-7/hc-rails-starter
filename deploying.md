# Deploying on Coolify

This guide covers deploying the app to [Coolify](https://coolify.io).

## Prerequisites

- A Coolify instance (self-hosted or cloud)
- A PostgreSQL database
- A Redis instance (for Action Cable / background jobs)
- Your repository connected to Coolify via GitHub

## 1. Create Resources in Coolify

### Database

1. Go to your Coolify project and click **New Resource** > **Database** > **PostgreSQL**
2. Note the internal connection URL (e.g. `postgresql://postgres:password@project-db:5432/app`)

### Redis

1. Click **New Resource** > **Database** > **Redis**
2. Note the internal connection URL (e.g. `redis://default:password@project-redis:6379`)

## 2. Create the Application

1. Click **New Resource** > **Application**
2. Select your GitHub repository and branch
3. Set **Build Pack** to **Dockerfile** (the repo includes a `Dockerfile` at the root)
4. Set the **Exposed Port** to `80` (Thruster handles HTTP)

## 3. Configure Environment Variables

Add the following environment variables in **Settings** > **Environment Variables**. Refer to `.env.production.example` for the full list.

### Required

| Variable | Description |
|---|---|
| `DATABASE_URL` | PostgreSQL connection URL from step 1 |
| `REDIS_URL` | Redis connection URL from step 1 |
| `RAILS_MASTER_KEY` | Contents of `config/master.key` |
| `SECRET_KEY_BASE` | Run `bin/rails secret` locally to generate |
| `APP_HOST` | Your app's domain (e.g. `app.example.com`) |

### OAuth & Integrations

| Variable | Description |
|---|---|
| `HCA_CLIENT_ID` | HCA OAuth client ID |
| `HCA_CLIENT_SECRET` | HCA OAuth client secret |
| `SLACK_BOT_TOKEN` | Slack bot token for profile sync |

### Storage (Cloudflare R2)

| Variable | Description |
|---|---|
| `R2_ACCESS_KEY_ID` | Cloudflare R2 access key |
| `R2_SECRET_ACCESS_KEY` | Cloudflare R2 secret key |
| `R2_BUCKET` | R2 bucket name |
| `R2_ENDPOINT` | R2 endpoint URL |

### Optional

| Variable | Description |
|---|---|
| `GEOCODER_API_KEY` | Geocoding API key |
| `SKYLIGHT_AUTHENTICATION` | Skylight performance monitoring |
| `SENTRY_DSN` | Sentry error monitoring DSN |
| `LOOPS_API_KEY` | Loops.so API key for mailer |
| `MAILER_FROM` | Default from email address |
| `EXTERNAL_API_KEY` | API key for `/api/v1` endpoints |
| `UPTIME_WORKER_PING_URL` | Uptime monitoring ping URL |

## 4. Network Configuration

If your PostgreSQL and Redis resources are in the same Coolify project, use internal hostnames in `DATABASE_URL` and `REDIS_URL` so traffic stays on the internal Docker network.

## 5. Domain & SSL

1. In application **Settings**, add your custom domain
2. Coolify handles SSL certificates automatically via Let's Encrypt

## 6. Deploy

Push to your configured branch or click **Deploy** in the Coolify dashboard. The Docker entrypoint automatically runs `rails db:prepare` on each deploy, so migrations are applied on startup.

## Health Checks

Configure Coolify's health check to hit your app on port `80` at `/up` (the default Rails health check endpoint).

## Troubleshooting

- **Assets not loading**: Ensure `RAILS_MASTER_KEY` is set correctly — asset precompilation happens at build time with a dummy key, but the app needs the real key at runtime for encrypted credentials.
- **Database connection errors**: Verify `DATABASE_URL` uses the correct internal hostname and that the database resource is running.
- **WebSocket / Action Cable issues**: Confirm `REDIS_URL` is set and the Redis resource is healthy.
