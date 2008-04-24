require 'test/unit'
require 'rubygems'
require 'active_record'
require 'acive_support'

$:.unshift(File.dirname(__FILE__) + '/../lib')
RAILS_ROOT = File.dirname(__FILE__)

require 'chart_fu'
Object.send :include, ChartFu::Mixin