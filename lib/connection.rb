require 'sqlite3'

begin
  db = SQLite3::Database.new ENV['DATABASE_PATH']
rescue SQLite3::Exception => e
  puts "Exception Occurred"
  puts e
ensure
  db.close if db
end

