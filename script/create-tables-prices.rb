#!/usr/bin/env ruby

require './lib/execute_sql'

action = :up

up = <<~DDL
  create table if not exists prices (
    id text not null primary key,
    item_number text not null unique,
    price integer not null,
    created_at text not null default current_timestamp
  );
DDL

down = <<~DDL
  drop table cars;
DDL

sql = (action == :up ? up : down)

ExecuteSql.call(sql)

