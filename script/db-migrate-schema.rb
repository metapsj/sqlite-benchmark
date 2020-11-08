#!/usr/bin/env ruby

require './db/migrate/enable_wal'
require './db/migrate/enable_synchronous'
require './db/migrate/create_prices'

puts "enable journal mode wal"
wal = EnableWal.build.up

puts "enable synchronous normal"
sync = EnableSynchronous.build.up

puts "create table prices"
prices = CreatePrices.build.up

