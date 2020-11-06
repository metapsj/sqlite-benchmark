require './lib/execute_sql'

module Migratable
  def self.included(cls)
    cls.class_exec do
      include Migrate
      include Execute
      extend Build
      prepend Configure

      alias_method :call, :execute
    end
  end

  module Build
    def build(action=nil)
      action ||= :up
      instance = new
      instance.configure(action: :up)
      instance
    end

    def call
      instance = build
      instance.call
    end
  end

  module Migrate
    def up
      raise "Migrate#up has not been implemented"
    end

    def down
      raise "Migrate#down has not been implemented"
    end
  end

  module Configure
    def configure(**kwargs)
      action = kwargs.fetch(:action, :up)
      sql = (action == :up ? up : down)
    end
  end
  
  module Execute
    attr_accessor :action, :sql

    def execute
      execute_sql = ExecuteSql.new(ENV['DATABASE_PATH'])
      execute_sql.open if execute_sql
      execute_sql.call(sql)
      execute_sql.close if execute_sql
    end
  end
end

