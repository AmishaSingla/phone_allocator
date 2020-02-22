# Phone Number Allocator

Test project for phone number allocation

# Setup

- Ruby version - 2.5.1
- Rails version - 5.1

1. `git clone <url>`
2. `cd phone_allocation`
3. `bundle install`
4. `rake db:create`
5. `rake db:migrate`
6. `rails s` or `bundle exec rails s`

API will serve on `http:/localhost:3000`

# How to run APIs

1. Random phone allocation API - `POST` `http://localhost:3000/phones`.
2. Specific phone allocation API - `POST` `http://localhost:3000/phones/1234567890`
3. List allocated phone number API - `GET` `http://localhost:3000/phones`.

# Testing

Included model specs and integration specs.

`rails test` or `bundle exec rails s`

# Contribute

Please reach out to me at `amisha@fiblabs.com`
