#!/usr/bin/env ruby

require './lib/execute_sql'

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

ExecuteSql.call(sql)

