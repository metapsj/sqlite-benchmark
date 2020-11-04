
require 'benchmark'

module Benchmarkable

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

  def call
    setup
    benchmark
    teardown
  end

end

