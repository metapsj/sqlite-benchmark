require 'sqlite3'

module Migration
  class ExecuteSql

    def self.call(sql)
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

