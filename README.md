Welcome to the source for Game Arch!

This application uses ruby 2+, rails 5+, and postgres.

It also uses the IGDB public API for data. In order to use the API you will need to create your own API key found here:

https://www.igdb.com/api

You will need to set an environment variable with the key, for example:

export IGDB_USER_KEY='yourkeyhere'

Additionally you may need to update the url in the initializer found at config/initializers/igdb_connection.rb

Ideas for the future:

* The keyword search incrementation is not really going to be totally accurate and using something better to increment the counter for searches, would be ideal. But, maybe that number isn't all to important to be perfect.

* Obviously this data is rarely going to change, so caching search histories would be a good first step towards optimization.

* That monkey patch for the gem is just a festering mold that should be removed as soon as possible, so pushing a fix for the gem would be the right thing to do here.

