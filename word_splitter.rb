#the method each is available for string and other objects
#to use each in a object from a custom class you will need to create a custom method
class WordSplitter
  
  include Enumerable

  attr_accessor :string #will hold the string obj which will call the each from Enumerable 
 
 def each
    string.split(" ").each do |word|
      yield word
    end
  end
end
#calling: 
=begin
splitter = WordSplitter.new
splitter.string = "one two three"

splitter.each do |word| 
  puts word
end
=end
