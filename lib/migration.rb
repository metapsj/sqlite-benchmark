require './lib/execute_sql'

module Migration
  attr_reader :action, :sql

  def initialize(action)
    @action = action ||= :up
    @sql = (action == :up ? up : down)
  end

  def up
    raise "up method is not implemented"
  end

  def down
    raise "down method is not implemented"
  end

  def run
    execute
  end

  private

  def execute
    ExecuteSql.new(ENV['DATABASE_URL']).call(sql)
  end

end

