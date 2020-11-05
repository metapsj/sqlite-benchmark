
module Migratable
  def self.included(cls)
    cls.class_exec do
      include SomethingInclude
      extend AnotherExtend
    end

    def method_included
      puts "#method_included"
    end
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

