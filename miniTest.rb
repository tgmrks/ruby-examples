require 'minitest/autorun' #from standard library, loads the MiniTest 

class TestSomething < Minitest::Test
 
  def test_true_assertion
    assert(true)
  end

  def test_false_assertion
    assert(false)
  end

end
