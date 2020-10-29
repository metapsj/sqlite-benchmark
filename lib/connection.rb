require 'sqlite3'

DB = SQLite3::Database.new ENV['DATABASE_PATH']
