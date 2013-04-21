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
SkyMorph::Observation.find_by_orbit(epoch, ecc, per, per_date, om, w, i, h)
```

Once you have an observation, you can retrieve its images:

```ruby
observation.images
```

You can also look up images directly, if you have their key:

```ruby
obs = SkyMorph::Observation.find('Ceres').first
key = obs.key # '|960612124155|50246.529224537|244.586842294571|-18.7630733314539|244.964565|-18.55884|7.30|-32.09|-4.65|0.05|0.04|-19.63|2942.15100272039|2568.62273640486|y|'
SkyMorph::Image.find(key)
```
##Interpreting Results

* Observation Identification: The CCD containing the object at a specified location.
* Triplet: This value tells the searcher if the singlet image is a part of a set of triplet images depicting the motion of the object being searched.
* Time: The observing time in UTC.
* Predicted Object Position: The object's predicted position according to the Ephemeris of the observation site.
* Observation Center: The center of the field of view of the observation specific CCD.
* Magnitude: The object's apparent magnitude.
* Velocity: This is split into two different values and has units of arc seconds per hour. The first value displays the velocity in the North-South direction. An object moving from South to North will display a positive number in this column and vice-versa. The second value displays the velocity in the East-West direction. An object moving from West to East will display a positive number in this value and vice-versa.
* Offset: Shown in arc minutes. This is the difference between the predicted object position and the center of the field of view.
* Positional Error: This is split into three values: Major, Minor and Position Angle. Both the major and minor errors are shown in arc seconds and the position angle is shown in degrees.
* Pixel Location: This value gives the coordinates of the object on the singlet image on the X-Y plane on the large overall image. For most images the range is 0 to 4000 in both the X and Y directions. The object will not be depicted on any image located greater than 4000 or less than 0.

## Testing

SkyMorph uses Rspec for testing. To run the specs, execute `rspec`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
