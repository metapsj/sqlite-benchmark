require './lib/migratable'

class EnableSynchronous
  include Migratable

  def up
    <<~DDL
      pragma synchronous=NORMAL;
    DDL
  end

  def down
    <<~DDL
      pragma synchronous=FULL;
    DDL
  end
end

