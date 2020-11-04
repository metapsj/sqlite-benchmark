
require 'benchmark'

module Benchmark
  module Base

    def setup
      raise "implementation is not defined"
    end

    def teardown
      raise "implementation is not defined"
    end

    def exercise
      raise "implementation is not defined"
    end

    def benchmark
    end

    def run
      setup
      benchmark
      teardown
    end

  end
end

