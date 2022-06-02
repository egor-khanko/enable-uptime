#!/bin/bash
cd $1

bundle exec rake db:create db:migrate
bundle exec rails s -b 0.0.0.0
