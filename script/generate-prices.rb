#!/usr/bin/env ruby

require 'securerandom'
require 'time'
require 'digest/murmurhash'

# 100, 1000, 10000
frequency = 1000

frequency.times do |count|
  price_id = SecureRandom.uuid
  created_at = Time.now.iso8601
  price = rand(0.47..100.00).round(2)
  item_number = Digest::MurmurHash64A.hexdigest("#{price_id}-#{price}-#{created_at}-#{count}")

  "#{price_id}, #{item_number}, #{price}, #{created_at}"
end

