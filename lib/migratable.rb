require 'sqlite3'

module Migratable
  def self.included(cls)
    cls.class_exec do
      extend Macro
      extend Build
      include Configure
      include Migrate
      include Database
    end
  end

  module Macro
    attr_reader :up_sql, :down_sql

    def up(sql)
      @up_sql = sql
    end

    def down(sql)
      @down_sql = sql
    end
  end

  module Build
    def build
      instance = new
      instance.configure
      instance
    end
  end

  module Configure
    def configure
      open ENV['DATABASE_PATH']
    end
  end

  module Migrate
    # consider moving assignment to configure 
    # rather than exposing class methods to instance methods
    def up_sql
      self.class.up_sql
    end

    # consider moving assignment to configure 
    # rather than exposing class methods to instance methods
    def down_sql
      self.class.down_sql
    end

    def up
      execute(up_sql)
    end

    def down
      execute(down_sql)
    end
  end

  module Database
    attr_reader :db

    def open(connection_string)
      begin
        @db = SQLite3::Database.new connection_string
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      end
    end

    def close
      db.close if db
    end

    def execute(sql)
      begin
        db.execute sql
      rescue SQLite3::Exception => e
        puts "Exception Occurred"
        puts e
      end
    end
  end
end

