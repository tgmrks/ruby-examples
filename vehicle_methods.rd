# no parentheses are needed in case of no parameters
def accelerate
  puts "Stepping on the gas"
  puts "Speeding up"
end

def sound_horn 
  puts "Pressing the horn button"
  puts "Beep beep!"
end 

def use_headlights(brightness = "low-beam")
  puts "Truning on #{brightness}"
  puts "watch out the deer!"
end 

def mileage(miles_driven, gas_used)
  if gas_used == 0
    return 0.0
  end
  miles_driven / gas_used
end

# calling the methods 
sound_horn
accelerate
use_headlights("high-beam")
puts mileage(0, 0)
