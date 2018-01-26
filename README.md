# [Troveko](http://troveko.com)

CHANGE

--

## Highlights
- Heroku
- Postgres
- Rails
- [rails-templates](https://github.com/lewagon/rails-templates)
- postmark-mailer
- Stripe
- Twilio
- [simple_form]()

## Setup

- `brew update && brew install postgresql`
- `brew services start postgresql start`

- `gem install middleman`
- `gem install nokogirl`
- `gem install pry` // maybe
- `gem install colored` //maybe
- `gem install rspec-rails` //maybe

- `gem install bundler`
- `bundle install`

- `rails db:drop`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`
- `rails routes`
- `rails db:rollback`
- `rails start` // start
- `rails generate model NAME_OF_MODEL`
- `rails generate controller NAME_OF_MODEL`

## Contributing

- Setup test/development enviornment with appropriate keys in GitHub hosted project
- Obscusify git history for `/config/application.yml`
- Document postgresql database local setup
- Remove the `react-on-rails` legacy bloat
  - Created with the command `rails generate react_on_rails:install`
- Provision test database (Heroku)
- Document Heroku deployment protocol
- Fixup Stripe
- Fixup Twilio
- Fixup postmark-mailer
- Document diff between `rake` and `rails`
  - Do we __need__ rake?
- Organize Gemfile into appropriate `development` and `production` gems
- Introduce Google Analytics

***

## Thanks
- Created, and maintained by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
