
module Modulable
  def self.included(cls)
    cls.class_exec do
      include IncludeSomething
      extend ExtendAnother
    end

    def defined_via_hook
      puts "#defined_via_hook"
    end
  end

  def defined_directly
    puts "#defined_directly"
  end

  module IncludeSomething
    def something
      puts "IncludeSomthing#something"
    end
  end

  module ExtendAnother
    def another
      puts "ExtendAnother::another"
    end
  end
end

class Testy
  include Modulable
end

