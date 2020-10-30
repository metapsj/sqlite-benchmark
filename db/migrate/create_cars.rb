#!/usr/bin/env ruby

require 'sqlite3'

DB = SQLite3::Database.new ENV['DATABASE_PATH']

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

DB.execute sql 

