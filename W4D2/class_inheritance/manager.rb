require_relative "./employee.rb"

class Manager < Employee
  attr_reader :employees
  def initialize(name, salary, boss = nil)
    @employees = []
    super(name, "Manager", salary, boss)
  end

  def bonus(multiplier)
    @employees.map(&:salary).sum
  end
end

p [1,2,3].map(&:to_s)