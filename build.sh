#!/bin/bash
cd "${0%/*}"
python3 ./buildERB.py
sudo gem install bundler
sudo bundle install
bundle exec middleman build --clean --verbose