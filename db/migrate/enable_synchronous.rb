#!/bin/usr/env ruby

require './lib/migration'

class EnableSynchronous
  include Migration

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

EnableSynchronous.new(:up).run

