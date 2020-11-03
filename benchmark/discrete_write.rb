#!/usr/bin/env ruby

require 'benchmark'
require 'securerandom'
require 'time'
require 'digest/murmurhash'
require './lib/execute_sql'

@execute_sql = ExecuteSql.new(ENV['DATABASE_PATH'])
@execute_sql.open

def setup
  @execute_sql.call <<~DDL
    create table if not exists prices (
      price_id text not null primary key,
      item_number text not null unique,
      price integer not null default 0,
      created_at text not null default current_timestamp
    );
  DDL
end

def teardown
  @execute_sql.call <<~DDL
    drop table prices;
  DDL
end

def exercise(frequency)
  frequency.times do |count|
    price_id = SecureRandom.uuid
    created_at = Time.now.iso8601
    price = rand(0.47..100.00).round(2)
    item_number = Digest::MurmurHash64A.hexdigest("#{price_id}-#{price}-#{created_at}-#{count}")
    
    @execute_sql.call <<~DML
      insert into prices values (
        '#{price_id}', 
        '#{item_number}', 
        #{price}, 
        '#{created_at}'
      );
    DML
  end
end

def benchmark
  Benchmark.bm(7) do |x|
    x.report("100:") { exercise(100) }
    x.report("1K:") { exercise(1000) }
    x.report("10K:") { exercise(10000) }
  end
end

setup
benchmark
teardown

