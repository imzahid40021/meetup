# Meetup

## Description

A meetup site

## Getting Started

Follow below instructions to set up the project on your local machine.

### Prerequisites

Make sure you have the following installed:
- Ruby 3.0.2
- PostgreSQL

### Installing

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/your-repository-name.git
   cd your-repository-name


2. **Install the required gems:**

   ```bash
   bundle install
   ```

3. **Setup the database:**

   ```bash
   bin/rails db:create
   bin/rails db:migrate
   bin/rails db:seed
   ```

4. **Start the Rails server:**

   ```bash
   bin/rails server
   ```

   Navigate to `http://localhost:3000` in your browser to see the application.

## Gems

### Core Gems

- `rails (~> 7.1.3)`: The Rails framework.
- `pg (~> 1.1)`: PostgreSQL adapter for Active Record.
- `puma (>= 5.0)`: Web server for Rails.
- `importmap-rails`: Manage JavaScript dependencies.
- `turbo-rails`: Hotwire's SPA-like page accelerator.
- `stimulus-rails`: Hotwire's modest JavaScript framework.
- `jbuilder`: Build JSON APIs with ease.
- `redis (>= 4.0.1)`: Redis adapter for Action Cable.

### Development and Testing Gems

- `factory_bot_rails`: Fixtures replacement with factory patterns.
- `faker`: Generate fake data for testing.
- `pry-byebug`: Debugging tool.
- `rails-controller-testing`: Testing controllers in Rails.
- `shoulda-callback-matchers`: Matchers for Active Record callbacks.
- `shoulda-matchers`: Matchers for various Rails components.
- `simplecov`: Code coverage analysis.

### Code Quality and Performance

- `rubocop`: Ruby static code analyzer.
- `rubocop-minitest` / `rubocop-rspec`: RuboCop extensions for Minitest/RSpec.
- `rubocop-performance`: Performance-oriented checks.
- `rubocop-rails`: Rails-specific checks.

### Testing Frameworks

- `rspec-rails`: RSpec testing framework for Rails.
- `capybara`: Integration testing tool.
- `selenium-webdriver`: Browser automation.
- `webdrivers`: WebDriver binaries for Capybara.

## Schema

### Tables

- **groups**

  - `name`: string, not null
  - `is_deleted`: boolean, default: false
  - `created_at`: datetime, not null
  - `updated_at`: datetime, not null

- **roles**

  - `name`: string, not null
  - `created_at`: datetime, not null
  - `updated_at`: datetime, not null

- **user_groups**

  - `user_id`: bigint, not null
  - `role_id`: bigint, not null
  - `group_id`: bigint, not null
  - `role_name`: string, not null
  - `created_at`: datetime, not null
  - `updated_at`: datetime, not null

- **users**
  - `first_name`: string, not null
  - `last_name`: string, not null
  - `created_at`: datetime, not null
  - `updated_at`: datetime, not null

### Associations

- `user_groups` table has foreign keys to `groups`, `roles`, and `users` tables.

