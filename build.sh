#!/bin/bash

# Copyright 2020 Wirepath Home Systems, LLC. All rights reserved.

cd "${0%/*}"
python3 ./buildERB.py
sudo gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
bundle config path ./vendor/bundle
bundle install --jobs 4 --retry 3
bundle exec middleman build --clean --verbose
