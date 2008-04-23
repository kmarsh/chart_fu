require 'chart_fu/charts/line_chart'
require 'chart_fu/charts/pie_chart'
require 'chart_fu/backends/google_chart_api_backend'

puts "chart_fu loaded"

module ChartFu
  
  # config stuff here
  
  module Mixin    
    def chart_fu(*oopts)
      
      model = oopts[0]
      opts = oopts.shift
      
      # TODO: Better test if +model+ really is an AR model
      if model.is_a?(Class)
        model.send(:count, :group => "DATE(created_at)")
        
        Backends::GoogleChartAPI::Charts::Line.new(opts).render
      else
        # handle something that isn't a 
      end
      
    end
  end
end