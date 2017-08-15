lines = []
File.open("/home/ismael/ruby/Rails-examples/votes.txt") do |file|
  lines = file.readlines
end

votes = Hash.new(0) #'0' will be the defauld value when trying to add a new vote, instead of returning 'nil'

lines.each do |line|
  name = line.chomp #remove '/n'
  name.upcase! #normalizing word
  votes[name] += 1
end

puts 'votes tally: ' 

votes.each do |key, value|
  puts "#{key}: #{value}"
end

#using hashes as method parameters
def area(options) #taking one hash instead of multiple parameters, imagine you had to pass 10 parameters...
  options[:width] * options[:length] #the use of symbols :key is a convention for hash method parameters
end
#the advantages are not only in the fact that multiple parameters can be bundled together 
#but also the order of the parameters do not matter 
puts "area: " + "#{area({:width => 4, :length => 2})}"

class Candidate
  attr_accessor :name, :age, :occupation, :hobby, :birthplace
  def initialize(name, options = {}) #var 'name' and hash paramters 'options'
    self.name = name
    self.age = options[:age]
    self.occupation = options[:occupation]
    self.hobby = options[:hobby]
    self.birthplace = options[:birthplace] 
  end
end

candidate1 = Candidate.new("Ismael T. Marques", 
{:age => 27, :occupation => "MF Storage Support", :hobby => "programmer"} ) #the order does not matter for the hash! 
#if you leave a parameter off it will be assigned as 'nil' when you reach for a Hash that does not exist
#in our example: 'self.birthplace = options[:birthplace]' will be set to 'nil' as is a default value for the non-existent hash
#for instance, all hash can be leave off if there is a default one defined in the 'initializer' ...'options = {}'
#also, as long as the hash is te final argument, the 'curly braces' can be left off
#furthermore, the '=>' can leave of with we use symbols for our keys, by replacing colon ':' for '=>'
candidate2 = Candidate.new("John Doe", occupation: "double", hobby: "singer", age: 37)
#the downside of using hash method arguments is that if you misspell a key it'll be faced as a new argument
#and the one you aimed for will be set to 'nil'. To ensure that some arguments are provided you can define them in the initialize like:
### def initialize(name, age:, occupation:, etc...) #as they dont have default args Ruby will raise an error if you dont provide the values
#when calling 'candidate.new'
p candidate1
p candidate2

=begin ###REQUIRED HASH PARAMETERS Only works for Ruby version 2.1 and above  
class CandidateB
  attr_accessor :name, :age, :occupation, :hobby, :birthplace
  def initialize(name, age:, occupation:, hobby: nil, birthplace: nil) #hash 'age' and 'occupation' are required as they dont have value assined
    self.name = name
    self.age = options[:age]
    self.occupation = options[:occupation]
    self.hobby = options[:hobby]
    self.birthplace = options[:birthplace]   
  end
end

candidate3 = CandidateB.new("Jon Snow", age:30, occupation: "King of the North")
p candidate3)
=end
