require './lib/migratable'

class CreatePrices
  include Migratable

  up <<~SQL
    create table if not exists prices (
      price_id text not null primary key,
      item_number text not null unique,
      price integer not null,
      created_at text not null default current_timestamp
    );
  SQL

  down <<~SQL
    drop table prices;
  SQL
end

