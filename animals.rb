#Superclass Animal
class Animal
  
  attr_reader :age, :name

  def name=(new_name)
    if new_name == ""
      raise "name can't be blank!"
    end
    @name = new_name
  end

  def age=(new_age)
    if new_age < 0
      raise "age can't be less than 0"
    end
    @age = new_age
  end  

  def talk
    puts "#{@name} makes noise"
  end

  def move(destination)
    puts "goes to #{destination}"
  end

  def report_age
    puts "#{@name} is #{@age} years old"
  end

end

#creating subclasses
class Dog < Animal
  def talk
    puts "#{@name} says bark!"
  end
end

class Bird < Animal
  def talk
    puts "#{@name} says chirp!"
  end
end

class Cat < Animal
  def talk
    puts "#{@name} says meow!"
  end
end

class Armadillo < Animal
  def move(destination)
    puts "#{@name} unrolls"
    super
  end
end

doge = Dog.new
doge.name = "Doggo"
doge.age = 4
puts doge.name
doge.talk
doge.move("bathroom")

bord = Bird.new
bord.name = "Loro"
bord.age = 10

puts bord.name
bord.talk
bord.move("tree")

cate = Cat.new	
cate.name = "Miopia"
cate.age = 7

puts cate.name
cate.talk
cate.move("sofa")

armo = Armadillo.new
armo.name = "Trapy"
armo.age  = 2

puts armo.name
armo.talk
armo.move("the jungle")
puts Armadillo.superclass
puts Animal.superclass

dogy = Dog.new 
dogy.move("anywhere")
