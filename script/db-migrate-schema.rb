#!/usr/bin/env ruby

require './db/migrate/enable_wal'
require './db/migrate/enable_synchronous'
require './db/migrate/create_prices'

EnableWal.new(:up).call
EnableSynchronous.new(:up).call

CreatePrices.new(:up).call

