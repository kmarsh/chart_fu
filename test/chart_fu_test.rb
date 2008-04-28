require File.expand_path(File.dirname(__FILE__) + "/test_helper")

class ChartFuTest < Test::Unit::TestCase

  def test_activerecord_model_chart_fu
    
  end
  
  def test_array_chart_fu
    values = [1, 2, 3, 4, 5, 6]
    chart = chart_fu(values)
    assert_equal values, chart.data
  end
  
  def test_hash_chart_fu
    
  end

end