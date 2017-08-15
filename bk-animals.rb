#classes must be CamelCase while variables are snake_case
class Dog

  attr_reader :age

  #attribute wirter - allows to set a value to the instance variable
  def name=(new_name)
    if new_name == "" 
      raise "name can't be blak!"
    end	 
    @name = new_name
  end
  
  #attribute reader - allows to get value from the instance variable
  def name
    @name 
  end
  
  def age=(new_age)
    if new_age < 0
      raise "age can't be less than 0"
    end
    @age = new_age
  end

  def talk
    puts "bark bark!!"
  end

  def move(destination)
    puts "walks to #{destination}"
  end

end


class Bird

attr_reader :name, :age

  def name=(new_name)
    @name = new_name
  end

  def age=(new_age)
    @age = new_age
  end

  def talk
    puts "chirp chirp!!"
  end

  def move(destination)
    puts "flies to #{destination}"
  end

end

doge = Dog.new
doge.name = "Doggo"
doge.age = 4

puts doge.name
puts doge.age
doge.talk
doge.move("bathroom")

bord = Bird.new
bord.name = "Loro"
bord.age = 10

puts bord.name
puts bord.age
bord.talk
bord.move("tree")

dogie = Dog.new	
doge.name = ""
doge.age = -4

