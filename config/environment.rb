require 'bundler'
Bundler.require
require 'active_record'
require 'open-uri'

# DB = {
#   :connection => SQLite3::Database.new("db/rooms-development.sqlite")
# }
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/rooms-development.sqlit"
)

#open db/rooms-development.sqlite
#opens sql in application

require_all 'lib'
