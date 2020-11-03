#!/usr/bin/env ruby

require 'benchmark'
require 'digest/murmurhash'

hash_en_times = ->(n) do
  n.times { Digest::MurmurHash64A.hexdigest("some random noise to hash #{n}") }
end

Benchmark.bm(7) do |x|
  x.report("1") { hash_en_times.call(1) }
  x.report("100") { hash_en_times.call(100) }
  x.report("1K") { hash_en_times.call(1000) }
  x.report("10K") { hash_en_times.call(10000) }
  x.report("100K") { hash_en_times.call(100000) }
end

