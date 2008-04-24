require 'test/unit'
require 'rubygems'
require 'active_record'
require 'acive_support'

$:.unshift(File.dirname(__FILE__) + '/../lib')
RAILS_ROOT = File.dirname(__FILE__)

require 'chart_fu'
Object.send :include, ChartFu::Mixin

# >> (Date.new(2007, 1, 1)..Date.new(2007, 12, 31)).each {|d| rand(10).times { Post.create(:created_at => d) } }
# => Mon, 01 Jan 2007..Mon, 31 Dec 2007
# >> (Date.new(2007, 1, 2)..Date.new(2007, 1, 28)).each {|d| rand(10).times { User.create(:created_at => d) } }
# => Tue, 02 Jan 2007..Sun, 28 Jan 2007
# >> (Date.new(2007, 1, 1)..Date.new(2007, 1, 6)).each {|d| rand(10).times { Building.create(:created_at => d) } }
# => Mon, 01 Jan 2007..Sat, 06 Jan 2007
