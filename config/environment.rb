require 'bundler'

Bundler.require
require 'open-uri'

DB = {
  :connection => SQLite3::Database.new("db/rooms-development.sqlite")
}

# DB = {
#   :connection => SQLite3::Database.new("db/rooms-development-two.sqlite")
# }

#open db/rooms-development.sqlite
#opens sql in application



require_all 'lib'
