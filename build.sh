#!/bin/bash

# Copyright 2020 Wirepath Home Systems, LLC. All rights reserved.

cd "${0%/*}"
while getopts c: name
do
	case $name in
	c)	if [ $OPTARG = "true" ]; then
			mv ./source/stylesheets/screen.css.scss ./source/stylesheets/screen_old.css.scss
			mv ./source/stylesheets/nolang.css.scss ./source/stylesheets/screen.css.scss
		fi
	esac
done
python3 ./buildERB.py
sudo gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
bundle config path ./vendor/bundle
bundle install --jobs 4 --retry 3
bundle exec middleman build --clean --verbose
