# Hack Club Rails Starter Template

This template aims to be a starting point for Hack Club programs written in Rails. It is heavily inspired by, with code used from, previous Hack Club programs such as the Summer of Making, HCB, or Submit.

## Features

- HCA OAuth authentication with automatic Slack profile sync
- Role-based access control (Admin, Reviewer, User) via Pundit
- Project CRUD with tagging, visibility controls, and soft delete
- Ship review workflow (pending, approved, returned, rejected) with frozen data snapshots and encrypted storage
- Admin dashboard for managing users, projects, ships, and background jobs
- Audit trails via PaperTrail
- File-based Markdown documentation with caching and auto-generated navigation
- Ahoy analytics with visit tracking, geolocation, and UTM attribution
- Rack::Attack rate limiting and request filtering
- Solid Queue, Solid Cache, and Solid Cable for jobs, caching, and WebSockets
- Hotwire (Turbo + Stimulus) with Tailwind CSS 4
- Sentry error tracking, Skylight performance monitoring
- Active Storage with Cloudflare R2 and image variant processing
- Kamal deployment with Thruster for HTTP caching/compression

## Local Development Setup

### 1. Prerequisites

- Ruby (see `.ruby-version` or Gemfile)
- Bundler (`gem install bundler`)
- Docker (for running Postgres)

### 2. Start Postgres with Docker

You can spin up a local Postgres instance using Docker:

```sh
docker run -d \
  --name hc-rails-starter-postgres \
  -e POSTGRES_USER=postgres \
  -e POSTGRES_PASSWORD=starter \
  -e POSTGRES_DB=hc_rails_starter_development \
  -p 5432:5432 \
  postgres:15
```

Update your `.env` file with the database URL:

```
DATABASE_URL=postgresql://postgres:starter@localhost:5432/hc_rails_starter_development
```

### 3. Install dependencies

```sh
bundle install
```

### 4. Setup the database

```sh
bin/rails db:setup
```

### 5. Start the Rails server

```sh
bin/dev
```

### Cloudflare R2 (Production)

Active Storage is configured to use Cloudflare R2 in production. Development uses local disk storage by default. To set up R2 for production, create an R2 bucket and API token in the Cloudflare dashboard, then set these environment variables:

```
R2_ACCESS_KEY_ID=your_access_key_id
R2_SECRET_ACCESS_KEY=your_secret_access_key
R2_BUCKET=your_bucket_name
R2_ENDPOINT=https://<account_id>.r2.cloudflarestorage.com
```

---

See `.env.development.example` for required environment variables.
