# [Troveko](http://troveko.com)

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

#### Heroku

Start the Heroku server in SSL mode for adding the SSL certificate via [letsencrypt](https://collectiveidea.com/blog/archives/2016/01/12/lets-encrypt-with-a-rails-app-on-heroku)
- `heroku ps:exec`

#### Rails

[Mac OSX rails setup tutorial](https://launchschool.com/blog/how-to-install-ruby-on-rails-development-environment-for-mac-os-x)

__&TLDR__


#### PostgreSQL

- `brew update && brew install po`
- `brew services start postgresql start`

---

__Create psql user and database?__
[Link to stack overflow post explaining db creation](https://stackoverflow.com/a/19829605/3940003)
  - Check eli' command line history for artifacts pertaining to the commands inside the post above

#### Gems

- `brew update && brew install rbenv ruby-build rbenv-gem-rehash`
- `gem install bundler`
- `rbenv rehash`
- `bundle install`

- `gem install middleman`
- `gem install nokogirl`
- `gem install pry` // maybe
- `gem install colored` //maybe
- `gem install rspec-rails` //maybe

#### Rails

- `rails db:create`
- `rails db:seed`
- `rails routes`

- `rails db:migrate`//??

- `rails db:drop`
- `rails db:rollback`
- `rails start` // start
- `rails generate model NAME_OF_MODEL`
- `rails generate controller NAME_OF_MODEL`

## Janky rails setup playbook

```
 rm -rf /usr/local/var/postgres && initdb /usr/local/var/postgres
 brew services restart postgresql
 rails s
 rake db:seed
 rake db:setup
 rake db:migrate
```

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
- Disable postmark postinstall message
  - ```Post-install message from postmark:

    ==================
    Thanks for installing the postmark gem. If you don't have an account, please
    sign up at http://postmarkapp.com/.

    Review the README.md for implementation details and examples.
    ==================```

***

## Thanks
- Created, and maintained by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
