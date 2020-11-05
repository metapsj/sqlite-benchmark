
module Modulable
  def self.included(cls)
    cls.class_exec do
      include SomethingInclude
      extend AnotherExtend
    end

    def included_in_hook
      puts "#included_in_hook"
    end
  end

  def included_directly
    puts "#included_directly"
  end

  module SomethingInclude
    def something
      puts "SomethingInclude#something"
    end
  end

  module AnotherExtend
    def another
      puts "AnotherExtend::another"
    end
  end
end

class Testy
  include Modulable
end

