require File.expand_path(File.dirname(__FILE__) + "/test_helper")

class ChartFuTest < Test::Unit::TestCase

  context "An ActiveRecord model" do
    setup do
      @chart = chart_fu(Post)
    end
    
    should "return a line chart of DATE(created_at) counts" do
      assert_kind_of ChartFu::Charts::Line, @chart
    end
    
    context "with a :from argument of 1.week.ago" do
      setup do
        @chart = chart_fu(Post, :from => 1.week.ago)
      end
    
      should "return a line chart of DATE(created_at) counts starting from 1 week ago" do
        assert_kind_of ChartFu::Charts::Line, @chart
        assert_equal 5, @chart.data.size
      end
    end
    
    context "with a :from argument of 2.week.ago" do
      setup do
        @chart = chart_fu(Post, :from => 2.week.ago)
      end
    
      should "return a line chart of DATE(created_at) counts starting from 2 weeks ago" do
        assert_kind_of ChartFu::Charts::Line, @chart
        assert_equal 11, @chart.data.size
      end
    end    
  end
  
  context "Two ActiveRecord models" do
    context "with no options specified" do
      setup do
        @chart = chart_fu([Post, User])
      end

      should "return a two-series line chart of DATE(created_at) counts" do
        assert_kind_of ChartFu::Charts::Line, @chart   
      end    
    end

    context "with basic options specified" do
      setup do
        @chart = chart_fu([Post, User], :title => "Posts and Users")
      end

      should "return a two-series line chart of DATE(created_at) counts" do
        assert_kind_of ChartFu::Charts::Line, @chart   
      end
      
      should "have a title" do
        assert_equal "Posts and Users", @chart.title
      end      
    end    
  end  
  
  context "An array of Fixnums" do
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
  
  context "An array of ActiveRecord models" do
    setup do
      @chart = chart_fu([Post, User])
    end
    
    should "return a line chart" do
      assert_kind_of ChartFu::Charts::Line, @chart
    end
  end
  
  context "An array of ActiveRecord models with options" do
    setup do
      @chart = chart_fu([Post, User], { :title => "Posts and Users" })
    end
    
    should "return a line chart" do
      assert_kind_of ChartFu::Charts::Line, @chart
    end
    
    should "have a title" do
      assert_equal "Posts and Users", @chart.title
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