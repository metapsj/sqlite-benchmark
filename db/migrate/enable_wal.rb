#!/bin/usr/env ruby

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

# consider: EnableWal.call(:up)
# or: EnableWal.new(:up).call
EnableWal.new(:up).run

