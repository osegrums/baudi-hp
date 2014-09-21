Baudi Hp
================

### Database setup

```bash
sudo su - postgres
createuser -s -P baudi_test
createuser -s -P baudi_dev
exit
rake db:create
```

### Deploy to Heroku

```bash
$ git push heroku master
$ heroku run rake db:migrate
```

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is open source and supported by subscribers. Please join RailsApps to support development of Rails Composer.

Ruby on Rails
-------------

This application requires:
- Ruby 2.1.0
- Rails 4.1.6
