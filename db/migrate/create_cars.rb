#!/usr/bin/env ruby

require 'sqlite3'

db = SQLite3::Database.new ENV['DATABASE_PATH']

sql = <<~DDL
  create table if not exists cars (
    id integer primary key, 
    label text, 
    price integer
  )
DDL

db.execute sql 

