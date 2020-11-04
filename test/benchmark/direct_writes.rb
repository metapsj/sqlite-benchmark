#!/usr/bin/env ruby

require './lib/benchmarkable'
require './lib/execute_sql'

class DirectWrites
  include Benchmarkable

  def setup
    @execute_sql = ExecuteSql.new(ENV['DATABASE_PATH'])

    @execute_sql.open if @execute_sql

    @execute_sql.call <<~DDL
      pragma journal_mode=WAL;
      pragma synchronous=NORMAL;
    DDL

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

    @execute_sql.close if @execute_sql
  end

  def exercise(prices)
    prices.each do |line|
      @execute_sql.call <<~DML
        insert into prices values (
          '#{line[0]}',
          '#{line[1]}',
          #{line[2]},
          '#{line[3]}'
        );
      DML
    end
  end

  def benchmark
    Benchmark.bm(7) do |x|
      prices = load_prices("prices-100.csv")
      x.report("100:") { exercise(prices) }

      prices = load_prices("prices-1K.csv")
      x.report("1K:") { exercise(prices) }

      prices = load_prices("prices-10K.csv")
      x.report("10K:") { exercise(prices) }
    end
  end

  private

  def load_prices(filename)
    fixture_path = File.expand_path(ENV['TEST_FIXTURE_PATH'])
    filepath = File.join(fixture_path, filename)
    prices = File.open(filepath, "r").map { |line| line.chomp.split(", ") }
  end

end

DirectWrites.new.call

