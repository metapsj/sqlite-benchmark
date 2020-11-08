#!/usr/bin/env ruby

require './db/migrate/enable_wal'
require './db/migrate/enable_synchronous'
require './db/migrate/create_prices'

puts "enable journal mode wal"
EnableWal.build.up

puts "enable synchronous normal"
EnableSynchronous.build.up

puts "create table prices"
CreatePrices.build.up

