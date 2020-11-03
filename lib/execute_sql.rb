require 'sqlite3'

class ExecuteSql
  attr_reader :connection_string, :db

  def initialize(connection_string)
    @connection_string = connection_string
  end

  def open
    begin
      @db = SQLite3::Database.new connection_string
    rescue SQLite3::Exception => e
      puts "Exception Occurred"
      puts e
    end
  end

  def call(sql)
    begin
      db.execute sql
    rescue SQLite3::Exception => e
      puts "Exception Occurred"
      puts e
    end
  end

  def close
    db.close if db
  end
end

