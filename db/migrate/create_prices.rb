#!/usr/bin/env ruby

require './lib/migration'

class CreatePrices
  include Migration

  def up
    <<~DDL
      create table if not exists prices (
        price_id integer not null primary key autoincrement,
        item_number text not null unique,
        price integer not null,
        created_at text not null default current_timestamp
      );
    DDL
  end

  def down
    <<~DDL
      drop table prices;
    DDL
  end
end

CreatePrices.new(:up).run
