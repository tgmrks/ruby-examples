#raise: raises an error exception which stops the execution flow
#rescue: gives a treatment for the exception 
#retry: return execution to the start of 'begin/end' block to reattemp after the rescue
#*a rescue/retry badly built may cause an infinite loop if the exception couldnt be rescued
#ensure: execute a code that must run regardless if there's any exception 
class OvenOffError < StandardError
end
class OvenEmptyError < StandardError
end

class SmallOven
  
  attr_accessor :contents, :state

  def turn_off
    @state = "off"
    puts "Turning off"
  end
  def turn_on
    @state = "on"
    puts "Turning on"
  end
  def bake
    unless @state == "on"
      raise OvenOffError, "you need to turn the oven on first!"
    end
    if @contents == nil
      raise OvenEmptyError, "there's nothing in the oven!"
    end
    "golden-brown #{contents}"
  end
end

dinner = ['turkey', nil, 'pie']
oven = SmallOven.new
oven.turn_off

dinner.each do |item|
  puts ""
  begin  
    oven.contents = item
    puts "Serving #{oven.bake}"
  rescue OvenEmptyError => error
    puts "Error: #{error.message}"
  rescue OvenOffError => error
    oven.turn_on
    retry
  ensure
    oven.turn_off
  end  
end




