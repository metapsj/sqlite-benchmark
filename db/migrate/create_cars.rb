#!/usr/bin/env ruby

require './lib/migration'

sql = <<~DDL
  create table if not exists cars (
    id integer primary key, 
    label text, 
    price integer
  )
DDL

DB.execute sql 

