# RspecMatcherNumTimes

[![Build Status](https://travis-ci.org/jantman/rspec-matcher-num-times.svg?branch=master)](https://travis-ci.org/jantman/rspec-matcher-num-times)
[![Code Coverage](https://codecov.io/github/jantman/rspec-matcher-num-times/coverage.svg?branch=master)](https://codecov.io/github/jantman/rspec-matcher-num-times?branch=master)
[![Code Climate](https://codeclimate.com/github/jantman/rspec-matcher-num-times/badges/gpa.svg)](https://codeclimate.com/github/jantman/rspec-matcher-num-times)
[![Gem Version](https://img.shields.io/gem/v/rspec-matcher-num-times.svg)](https://rubygems.org/gems/rspec-matcher-num-times)
[![Total Downloads](https://img.shields.io/gem/dt/rspec-matcher-num-times.svg)](https://rubygems.org/gems/rspec-matcher-num-times)
[![Github Issues](https://img.shields.io/github/issues/jantman/rspec-matcher-num-times.svg)](https://github.com/jantman/rspec-matcher-num-times/issues)
[![Project Status: Abandoned - Initial development has started, but there has not yet been a stable, usable release; the project has been abandoned and the author(s) do not intend on continuing development.](http://www.repostatus.org/badges/0.1.0/abandoned.svg)](http://www.repostatus.org/#abandoned)

This gem provides some rspec matchers to simplify asserting that something is included or matched N times.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-matcher-num-times'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-matcher-num-times

## Usage

In your spec_helper, add a line like:

    require 'rspec_matcher_num_times'

### Matchers

#### include_num_times

This matcher tests that a given item occurs N times in an array, or a given
substring occurs N times in a string.

    expect('foo bar foo').to include_num_times(2, 'foo')

    expect(['foo', 'bar', 'foo']).to include_num_times(2, 'foo')

## Contributing

1. Fork it ( https://github.com/jantman/rspec-matcher-num-times/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Testing

Spec tests are done automatically via Travis CI. They're run using Bundler and rspec.

For manual testing:

    bundle install
    bundle exec rake spec

## Releasing

1. Ensure all tests are passing, coverage is acceptable, etc.
2. Increment the version number in ``lib/rspec_matcher_num_times/version.rb``
3. Update CHANGES.md
4. Push those changes to origin.
5. ``bundle exec rake build``
6. ``bundle exec rake release``
