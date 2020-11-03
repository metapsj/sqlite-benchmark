#!/usr/bin/env ruby

require 'securerandom'
require 'time'
require 'digest/murmurhash'

CSV_PATH = File.expand_path(ENV['TEST_FIXTURE_PATH'])

files = [
  { filename: "prices-100.csv", frequency: 100 },
  { filename: "prices-1K.csv", frequency: 1000 },
  { filename: "prices-10K.csv", frequency: 10000 },
]

header = %w[price_id item_number price created_at]

def generate_csv(filename, frequency)
  csv = File.open(File.join(CSV_PATH, filename), "a")

  frequency.times do |count|
    price_id = SecureRandom.uuid
    created_at = Time.now.iso8601
    price = rand(0.47..100.00).round(2)
    item_number = Digest::MurmurHash64A.hexdigest("#{price_id}-#{price}-#{created_at}-#{count}")

    csv.write("#{price_id}, #{item_number}, #{price}, #{created_at}\n")
  end

  csv.close if csv
end

files
  .map(&:values)
  .each{ |filename, frequency| generate_csv(filename, frequency) }

