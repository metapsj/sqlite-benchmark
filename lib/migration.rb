require 'sqlite3'

module Migration
  module Base
    attr_reader :action, :sql

    def initialize(action = :up)
      @action = action
      @sql = (action == :up ? up : down)
    end

    def up
      raise "up method is not implemented"
    end

    def down
      raise "down method is not implemented"
    end

    def run
      execute
    end

    private

    def execute
      begin
        db = SQLite3::Database.new ENV['DATABASE_PATH']
        db.execute sql
      rescue SQLite3::Exception => e
        puts "Exception occurred"
        puts e
      ensure
        db.close if db
      end
    end

  end
end

