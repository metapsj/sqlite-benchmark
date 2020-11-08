require 'sqlite3'

class Database
  attr_reader :connection
  
  def open(connection_string)
    begin
      @connection = SQLite3::Database.new connection_string
    rescue SQLite3::Exception => e
      puts "Exception Occurred"
      puts e
    end
  end

  def call(sql)
    begin
      connection.execute sql
    rescue SQLite3::Exception => e
      puts "Exception Occurred"
      puts e
    end
  end

  def close
    connection.close if connection
  end
end

