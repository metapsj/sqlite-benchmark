require './lib/execute_sql'

module Migratable
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

  def call
    execute
  end

  private

  def execute
    execute_sql = ExecuteSql.new(ENV['DATABASE_PATH'])
    execute_sql.open if execute_sql
    execute_sql.call(sql)
    execute_sql.close if execute_sql
  end
end

