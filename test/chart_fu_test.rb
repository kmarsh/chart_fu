require File.expand_path(File.dirname(__FILE__) + "/test_helper")

class ChartFuTest < Test::Unit::TestCase

  context "An ActiveRecord model" do
    setup do
      @chart = chart_fu(Post)
    end
    
    should "return a line chart of DATE(created_at) counts" do
      assert_kind_of ChartFu::Charts::Line, @chart   
    end
  end
  
  context "Two ActiveRecord models" do
    setup do
      @chart = chart_fu(Post, User)
    end
    
    should "return a two-series line chart of DATE(created_at) counts" do
      assert_kind_of ChartFu::Charts::Line, @chart   
    end
  end  
  
  context "An array" do
    setup do
      @chart = chart_fu([1, 2, 3, 4, 5, 6])
    end
    
    should "return a line chart" do
      assert_kind_of ChartFu::Charts::Line, @chart
    end

    should "not have a title" do
      assert_equal "", @chart.title      
    end
    
    should "not have a legend" do
      assert !@chart.legend      
    end
  end
  
  context "A hash with labels as keys" do    
    setup do
      @chart = chart_fu({"A" => [1, 2, 3, 4, 5], "B" => [5, 4, 3, 2, 1]})
    end
    
    should "return a line chart" do
      assert_kind_of ChartFu::Charts::Line, @chart      
    end
    
    should "have a legend" do
      assert @chart.legend
    end
  end
  
  context "A hash with dates as keys" do
    setup do
      @chart = chart_fu({Date.new(2008, 2, 1) => 1, Date.new(2008, 3, 1) => 5}, :from => Date.new(2008, 1, 1), :to => Date.new(2008, 12, 31))
    end

    should "return a line chart" do
      assert_kind_of ChartFu::Charts::Line, @chart      
    end
    
    should "not have a legend" do
      assert !@chart.legend
    end
    
  end

end