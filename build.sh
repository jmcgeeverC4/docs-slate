#!/bin/bash

cp -r ./docs/ ./
python3 ./buildERB.py
sudo gem install bundler
sudo bundle install
bundle exec middleman build --clean --verbose