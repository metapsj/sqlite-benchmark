#!/bin/usr/env ruby

require 'sqlite3'

begin
  db = SQLite3::Database.new ':memory'
  puts db.get_first_value 'select SQLITE_VERSION();'
rescue SQLite3::Exception => e
  puts "Exception occurred"
  puts e
ensure
  db.close if db
end

