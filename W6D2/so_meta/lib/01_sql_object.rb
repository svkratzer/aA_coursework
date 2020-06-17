require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  
  @table_name = nil
  @columns = nil

  def self.columns
    if @columns.nil?
      query = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM 
          #{self.table_name}
      SQL
      @columns = query.first.map(&:to_sym)
      return @columns
    else
      return @columns
    end
  end

  def self.finalize!
    
  end

  def self.table_name=(table_name=nil)
    @table_name = (table_name.nil? ? self.to_s.downcase + 's' : table_name)
  end

  def self.table_name
    @table_name.nil? ? self.to_s.downcase + 's' : @table_name
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end

