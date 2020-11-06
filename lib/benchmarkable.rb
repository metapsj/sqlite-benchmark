require 'benchmark'

module Benchmarkable
  def self.included(cls)
    cls.class_exec do
      extend Build
      include Bench
      prepend Configure

      alias_method :call, :run
    end
  end

  module Build
    def build
      instance = new
      # instance.configure
      instance
    end

    def call
      instance = build
      instance.call
    end
  end

  module Configure
    def configure
      raise "Configure#configure has not been implemented"
    end
  end

  module Bench
    def setup
      raise "Benchmark#setup method has not been implemented"
    end

    def teardown
      raise "Benchmark#teardown method has not been implemented"
    end

    def exercise
      raise "Benchmark#exercise method has not been implemented"
    end

    def benchmark
      raise "Benchmark#benchmark method has not been implemented"
    end

    def run
      setup
      benchmark
      teardown
    end
  end
end

