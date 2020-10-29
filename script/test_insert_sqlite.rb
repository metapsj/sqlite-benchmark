#!/usr/bin/env ruby

require 'sqlite3'

begin
  db = SQLite3::Database.new ENV['TEST_DATABASE_PATH']

  db.execute "create table if not exists cars (id integer primary key, label text, price integer)"

  db.execute "insert into cars values (1, 'Audi', 52642)"
  db.execute "insert into cars values (2, 'Mercedes', 57127)"
  db.execute "insert into cars values (3, 'Skoda', 9000)"
  db.execute "insert into cars values (4, 'Volvo', 29000)"
  db.execute "insert into cars values (5, 'Bentley', 350000)"
  db.execute "insert into cars values (6, 'Citroen', 21000)"
  db.execute "insert into cars values (7, 'Hummer', 41400)"
  db.execute "insert into cars values (8, 'Volkswagen', 21600)"
rescue SQLite3::Exception => e
  puts "Excetion occurred"
  puts e
ensure
  db.close if db
end

