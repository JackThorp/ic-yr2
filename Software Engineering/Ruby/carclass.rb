

class Car
  def initialize(make)
	@make = make
  end
  def drive
    puts "We are driving in a #{@make}"
  end
end

my_car = Car.new("Toyota")
my_car.drive()

