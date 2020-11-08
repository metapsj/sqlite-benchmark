require './lib/migratable'

class EnableSynchronous
  include Migratable

  up <<~SQL
    pragma synchronous=NORMAL;
  SQL

  down <<~SQL
    pragma synchronous=FULL;
  SQL
end

