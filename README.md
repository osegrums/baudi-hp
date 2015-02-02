Baudi Hp
================

### Database setup

```bash
sudo su - postgres
createuser -s -P baudi_test
createuser -s -P baudi_dev
createuser -s -P baudi_prod
createdb -E UNICODE -O baudi_prod baudi_prod
exit
rake db:create
```
Ruby on Rails
-------------

This application requires:
- Ruby 2.1.0
- Rails 4.1.6
