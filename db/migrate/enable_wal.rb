#!/bin/usr/env ruby

require './lib/migration'

class EnableWal
  include Migration

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

