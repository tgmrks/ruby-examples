def my_method(&my_block)
  puts 'in the method'
  my_block.call
  my_block.call
  puts 'back in the method'
end

my_method do 
 puts 'in the block'
end

my_method do
 puts 'woo hoo'
end

#passing parameters to a block
def give(&block)
  block.call('money','jewelry')
end

give do |present1, present2|
  puts present1, present2
end

#trying YIELD
def say(&block)
  yield
end

say do
  puts "saying sth out loud"
end

def say_par(&block)
  yield 'hi', 'there'
end

say_par do |word1, word2| 
  puts "#{word1} #{word2}"
end

#we also can use 'curly braces' to write blocks
def say_braces
  yield 'sup!'
end

#one line block using curly braces is marely a convention
#it would work idented like do..end is
#blocks that covers more than one line should be written with do..end (as a convention)
say_braces { |word1| puts "#{word1}" }

puts "========================="

#using 'each' to loop through an array and execute a 'block'
def total(prices)
  amount = 0
  prices.each do |price| #passing the current element in the iteration
    amount += price
  end	
  amount #return
end

def refound(prices)
  amount = 0
  prices.each do |price| 
    amount -= price
  end
  amount #return
end

def show_discounts(prices)
  prices.each do |price|
    amount_off = price / 3.0
    puts format("Your discount: %.2f", amount_off)
  end
end

prices = [3.99, 25.00, 8.99]
puts format("%.2f", total(prices))
puts format("%.2f", refound(prices))
show_discounts(prices)

puts "========================="

lines = []
#open and read file
File.open("/home/ismael/ruby/Rails-examples/reviews.txt") do |review_file|
  lines = review_file.readlines
end

puts lines.length

relevant_lines = []

#looking for a value within the lines
#lines.each do |line|
#  if line.include?("Truncated")
#    relevant_lines << line
#  end
#end

#shorter way to look for a value 
relevant_lines = lines.find_all { |line| line.include?("Truncated") }

puts relevant_lines

reviews = relevant_lines.reject { |line| line.include?("--") }
puts "---"
puts reviews

def find_adjective(string)
  words = string.split(" ")
  index = words.find_index("is")
  words[index + 1]
end

adjectives = []

#reviews.each do |review|
#  adjectives << find_adjective(review)
#end

#Shortened 
#adjectives = reviews.map { |review| find_adjective(review) }
#Shortend, but with more than one line
adjectives = reviews.map do |review|
  adjective = find_adjective(review)
  "'#{adjective.capitalize}'"
end

puts adjectives
