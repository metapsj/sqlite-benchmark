#!/usr/bin/env ruby

require './db/migrate/enable_wal'
require './db/migrate/enable_synchronous'
require './db/migrate/create_prices'

puts "enable journal mode wal"
EnableWal.call(:up)

puts "enable synchronous normal"
EnableSynchronous.call(:up)

puts "create table prices"
CreatePrices.call(:up)

