require File.expand_path(File.dirname(__FILE__) + "/test_helper")

class ChartFuTest < Test::Unit::TestCase

  def test_activerecord_chart_fu
    s = "Hello, World!"
    assert_equal(13, s.length)
  end
  
  

end