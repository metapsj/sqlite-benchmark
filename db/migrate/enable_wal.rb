require './lib/migratable'

class EnableWal
  include Migratable

  up <<~SQL
    pragma journal_mode=WAL;
  SQL

  down <<~SQL
    pragma journal_mode=DELETE;
  SQL
end

