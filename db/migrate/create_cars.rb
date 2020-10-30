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

DB.execute (action == :up ? up : down)

