# Hack Club Rails Starter Template

This template aims to be a starting point for Hack Club programs written in Rails. It is heavily inspired by, with code used from, previous Hack Club programs such as the Summer of Making, HCB, or Submit.

## Features

### Authentication & Authorization
- User authentication via HCA OAuth 2.0 with CSRF protection
- Automatic Slack profile synchronization on login (avatar, display name, timezone)
- Role-based access control with Admin, Reviewer, and User roles
- Pundit authorization policies for all resources
- Session-based authentication with timeout management

### User Management
- Slack-integrated user profiles (avatar, display name, email, timezone)
- Soft delete support via discardable concern
- Verification status and is_adult tracking
- First-referrer attribution via Ahoy analytics

### Project Management
- Full CRUD with ownership validation
- Tagging system with GIN-indexed array field
- Visibility controls (listed/unlisted)
- Soft delete support
- URL validation for demo and repo links

### Review System (Ships)
- Project review/approval workflow (pending, approved, returned, rejected)
- Reviewer assignment and feedback
- Frozen project data capture (links, HCA data, screenshot) at submission time
- Encrypted HCA data storage (AES-256-GCM)
- Full audit trail via PaperTrail version history

### Admin Dashboard
- User administration with project details
- Project administration with ship information
- Ship/review management (approve, reject, return)
- Background job monitoring via MissionControl::Jobs

### Documentation System
- File-based Markdown docs with Redcarpet rendering
- Metadata extraction (title, description, priority, unlisted flag)
- Markdown extensions: tables, fenced code blocks, checkboxes, callouts/asides
- Production caching and auto-generated navigation

### Analytics
- Ahoy Matey visitor and event tracking
- Geolocation (IP, browser, OS, city, country, region)
- UTM parameter tracking (source, medium, campaign, content, term)
- Referrer and first-referrer attribution

### Background Jobs & Caching
- Solid Queue for background job processing
- Solid Cache for Rails.cache backend
- Solid Cable for Action Cable in production
- Uptime ping job for worker monitoring

### Security
- Rack::Attack rate limiting (300 req/5 min per IP, auth endpoint throttling)
- Suspicious request blocking (SQL injection patterns, WordPress scanners)
- Brakeman static security analysis
- Content Security Policy configuration
- Sensitive parameter filtering

### Frontend
- Hotwire stack (Turbo + Stimulus) for SPA-like navigation
- Tailwind CSS 4.0 for styling
- ImportMap for ESM module management
- Propshaft asset pipeline

### Monitoring & Deployment
- Sentry error tracking
- Skylight performance monitoring
- Health check endpoint (`/up`)
- Kamal for Docker container deployment
- Thruster for HTTP caching and compression

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

---

See `.env.development.example` for required environment variables.
