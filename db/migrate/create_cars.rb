#!/usr/bin/env ruby

require 'sqlite3'

action = :up

up = <<~DDL
  create table if not exists cars (
    id integer primary key,
    label text,
    price integer
  );
DDL

down = <<~DDL
  drop table cars;
DDL

sql = (action == :up ? up : down)

begin
  db = SQLite3::Database.new ENV['DATABASE_PATH']
  db.execute sql 
rescue SQLite3::Exception => e
  puts "Exception occurred"
  puts e
ensure 
  db.close if db
end

