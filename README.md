![Build Status](https://codeship.com/projects/5621fb20-e26d-0133-a2de-0229a9d1976f/status?branch=master)
[![Code Climate](https://codeclimate.com/github/concreteface/tourism3.0/badges/gpa.svg)](https://codeclimate.com/github/concreteface/tourism3.0)
[![Coverage Status](https://coveralls.io/repos/github/concreteface/tourism3.0/badge.svg?branch=master)](https://coveralls.io/github/concreteface/tourism3.0?branch=master)

[Sidestreeter on Heroku](http://t3p0.herokuapp.com/)

# Sidestreeter
---
___
## Description
___
This application is intended for sharing photos of off-the-beaten-track "tourist attractions." Things you won't find in a guidebook. There is a lot of great stuff out there that the world needs to see. Let's start sharing it.

## Technical Details
___

To build and run:

- change to desired directory
- `git clone https://github.com/concreteface/tourism3.0.git`
- `bundle install`
- `rake db:create`
- `rake db:migrate`
- run `rails s`
- visit `localhost:3000`

That's it!

- Built using Ruby version 2.2.3.
- Uses Postgres database accessed with ActiveRecord.
- Cloud storage (Google in this case) through carrierwave is used for photo storage.
- All uploads are automatically geocoded with the geocoder gem.
- EXIF data is extracted automatically using exifr.
- Comments use commontator and acts_as_votable gems.
- Pagination is achieved with kaminari.
- Additional geocoding done with Google Maps (the update location feature).
