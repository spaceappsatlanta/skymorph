# SkyMorph

[![Build Status](https://travis-ci.org/spaceappsatlanta/skymorph.png?branch=master)](https://travis-ci.org/spaceappsatlanta/skymorph)
[![Code Climate](https://codeclimate.com/github/spaceappsatlanta/skymorph.png)](https://codeclimate.com/github/spaceappsatlanta/skymorph)

A gem to interface with the NASA [SkyMorph](http://skyview.gsfc.nasa.gov/skymorph/skymorph.html).

There is a sample Sinatra app running this gem [on Heroku](http://skymorph.herokuapp.com/) with source code available [on GitHub](https://github.com/spaceappsatlanta/skynotra).

## Installation

Add this line to your application's Gemfile:

    gem 'skymorph'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install skymorph

## Usage

There are several ways to obtain observations:

```ruby
# By target name
SkyMorph::Observation.find('J99TS7A')

# By position - right ascension and declination may be strings or value objects
Skymorph::Observation.find_by_position(right_ascension, declination, time)

# By orbit - ...
SkyMorph::Observation.find_by_orbit epoch, ecc, per, per_date, om, w, i, h
```

Once you have an observation, you can retrieve its images:

```ruby
observation.images
```

You can also look up images directly, if you have their key:

```ruby
obs = SkyMorph::Observation.find('Ceres').first
key = obs.key # '|960612124155|50246.529224537|244.586842294571|-18.7630733314539|244.964565|-18.55884|7.30|-32.09|-4.65|0.05|0.04|-19.63|2942.15100272039|2568.62273640486|y|'
SkyMorph::Image.find key
```

## Testing

SkyMorph uses Rspec for testing. To run the specs, execute `rspec`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
