require 'chart_fu/charts/line_chart'
require 'chart_fu/charts/pie_chart'
require 'chart_fu/backends/google_chart_api_backend'

puts "chart_fu loaded"

module ChartFu
  
  # config stuff here
  
  module Mixin    
    def chart_fu(*args)
      args.inspect
    end
  end
end