require './lib/migratable'

class CreatePrices
  include Migratable

  def up
    <<~DDL
      create table if not exists prices (
        price_id text not null primary key,
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

