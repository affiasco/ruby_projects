require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = Array.new(0)
  end

  def valid_title?(title)
    @salaries.has_key?(title)
    
  end

  def >(other_startup)
    self.funding > other_startup.funding
  end

  def hire(employee_name, title)
    if valid_title?(title)
      @employees << Employee.new(employee_name, title)
    else
      raise "Title invalid, cannot add employee"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    title_pay = @salaries[employee.title] 
    if @funding >= title_pay
      employee.pay(title_pay)
      @funding -= title_pay
    else
      raise "Not enough funding to pay employee"
    end
  end

  def payday
    @employees.each { |employee| self.pay_employee(employee) }
  end
  
  def average_salary
    salary_total = 0
    @employees.each { |employee| salary_total += @salaries[employee.title] }
    salary_total / employees.length * 1.0
  end

  def close
    @employees = Array.new(0)
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding

    startup.salaries.each do |title, amount|
      if !@salaries.has_key?(title)
        @salaries[title] = amount
      end
    end
    
    @employees += startup.employees
    startup.close
  end


end
