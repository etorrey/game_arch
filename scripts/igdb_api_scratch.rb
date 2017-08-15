require 'igdb_api'
require 'ostruct'
require './lib/monkey_patches/igdb_requester'
require 'json'


Igdb.set_api_url("https://api-2445582011268.apicast.io")

Igdb.connect('foo')


p Igdb::Game.count
p Igdb::Game.find(1971)
p search


