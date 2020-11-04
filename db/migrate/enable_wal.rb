require './lib/migratable'

class EnableWal
  include Migratable

  def up
    <<~DDL
      pragma journal_mode=WAL;
    DDL
  end

  def down
    <<~DDL
      pragma journal_mode=DELETE;
    DDL
  end
end

