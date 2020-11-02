require 'sqlite3'

class ExecuteSql
  attr_reader :connection_string

  def initialize(connection_string)
    @connection_string = connection_string
  end

  def call(sql)
    begin
      db.execute sql
    rescue SQLite3::Exception => e
      puts "Exception Occurred"
      puts e
    ensure
      db.close if db
    end
  end

  private 

  def connect
    begin
      db = SQLite3::Database.new connection_string
    rescue SQLite3::Exception => e
      puts "Exception Occurred"
      puts e
    ensure
      db.close if db
    end
  end

end

