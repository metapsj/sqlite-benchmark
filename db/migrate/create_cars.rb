#!/usr/bin/env ruby

require './lib/migration'

class CreateCars
  include Migration::Base

  def up
    <<~DDL
      create table if not exists cars (
        id integer primary key,
        label text,
        price integer
      );
    DDL
  end

  def down
    <<~DDL
      drop table cars;
    DDL
  end
end

CreateCars.new(:up).run

