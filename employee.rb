class Employee

  attr_reader :name

  def initialize(name)
    self.name = name
  end

  def name=(name)
    if name == ""
      raise "name cant be blank!"
    end
    @name = name
  end

  def print_name
    puts "Name: #{name}"
  end 

end

class SalariedEmployee < Employee

  attr_reader :salary

  def salary=(salary)
    if salary < 0
      raise "salary cant be negative!"
    end
    @salary = salary
  end

#good - initialize attibutes when .new is called 
#  def initialize
#    @name = "Unknown"
#    @salary = 0.0
#  end
#better - allows arguments to be sent through .new
#  def initialize(name = "Unknown", salary = 0.0)
#    @name = name
#    @salary = salary
#  end
#best - access the instance methods name= and salary=
  def initialize(name = "Unknown", salary = 0.0)
   #self.name = name
    super(name)
    self.salary = salary
  end
#***Apart from accessor methods, 'self' can be omitted

  def print_pay_stub
#    puts "Name: #{@name}"
    print_name #from Super class
    pay_for_period = (salary / 365) * 14 #2 weeks is the pay period
    formated_pay = format("%.2f", pay_for_period)
#    puts "Sal.: #{@salary}"
    puts "Pay this period: $#{formated_pay}"
  end

end

class HourlyEmployee < Employee
  
  attr_reader :hourly_wage, :hours_per_week

#best - access the instance methods
  def initialize(name = "Unknown", hourly_wage = 0.0, hours_per_week = 0.0)
   # self.name = name
    super(name)
    self.hourly_wage = hourly_wage
    self.hours_per_week = hours_per_week	
  end

  def hourly_wage=(hourly_wage)
    if hourly_wage < 0
      raise "Wage cant be negative!"
    end
    @hourly_wage = hourly_wage
  end

  def hours_per_week=(hours_per_week)
    if hours_per_week < 0
      raise "Hours per week cant be negative!"
    end
    @hours_per_week = hours_per_week
  end

  def print_pay_stub
#    puts "Name: #{@name}"
    print_name #from Super class
    pay_for_period = hourly_wage * hours_per_week * 2 #2 weeks is the pay period
    formated_pay = format("%.2f", pay_for_period)
#    puts "Sal.: #{@salary}"
    puts "Pay this period: $#{formated_pay}"
  end

# Class methods: works like static methods in Java,
# it does not require an instance to access it (obj=class.new)
  def self.security_guard(name)
    HourlyEmployee.new(name, 19.25, 30)
  end

  def self.cashier(name)
    HourlyEmployee.new(name, 12.75, 25)
  end

  def self.janitor(name)
    HourlyEmployee.new(name, 10.50, 20)
  end

end

angela = HourlyEmployee.security_guard("Angela Matthews")
edwin = HourlyEmployee.cashier("Edwin Burges")
ivan = HourlyEmployee.janitor("Ivan Stokes")

angela.print_pay_stub
edwin.print_pay_stub
ivan.print_pay_stub

#amy = SalariedEmployee.new
#amy.name = "Amy Blake"
#amy.salary = 50000.0
#amy.print_pay_stub

#anna = HourlyEmployee.new
#anna.name = "Anna Broke"
#anna.hourly_wage = 35.0
#anna.hours_per_week = 30
#anna.print_pay_stub 

#kara = SalariedEmployee.new("Kara", 100000.0)
#kara.name = ""
#kara.print_pay_stub

#ben = HourlyEmployee.new("Ben", 40.0)
#ben.hours_per_week = 20
#ben.print_pay_stub

#doe = HourlyEmployee.new
#doe.print_pay_stub
