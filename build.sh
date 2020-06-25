#!/bin/bash

python3 ./buildERB.py
gem install bundler
bundle install
bundle exec middleman build --clean --verbose