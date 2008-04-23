require 'chart_fu/charts/line_chart'
require 'chart_fu/charts/pie_chart'
require 'chart_fu/backends/google_chart_api_backend'

puts "chart_fu loaded"

module ChartFu
  
  # config stuff here
  
  module Mixin    
    # Generate a chart based on what data is given in the first argument:
    #   ActiveRecord model: time series line chart with <tt>created_at</tt>
    #                       values on the x-axis, and the number of records
    #                       on the y-axis
    #
    #   Array:              line chart with ambigous x-axis and values of the
    #                       array on the y-axis
    #
    #   Hash:
    #   (<tt>Date</tt>s or <tt>Time</tt> keys)
    #                       time series line chart with keys as x-axis
    #   Hash:
    #                       pie chart with keys as labels               
    #
    #
    # Options:
    #  * <tt>:title</tt> - title, optional, default: blank
    #  * <tt>:width</tt> - width, optional, default: 320
    #  * <tt>:height</tt> - height, optional, default: 240
    #  * <tt>:from</tt> - beginning of chart if a time-series is used (also
    #                     enables the fill option), optional 
    #  * <tt>:fill</tt> - fill in missing dates if a time-series chart is used,
    #                     optional, default: false
    def chart_fu(data, opts = {})
      
      # Build up a graph based on what data we have
      case data.class
        # TODO: Better test if +model+ really is an AR model
        when Class
          # time-series line chart of +DATE(created_at)+ values
          data.send(:count, :group => "DATE(created_at)")
          
        when Array
          # ambiguous x-axis line chart
          
        when Hash
          if data.keys.all? {|k| k.is_a?(Date) || k.is_a(Time) }
            # time-series line chart
            
          else
            # pie chart
            
          end
      end
      
      Backends::GoogleChartAPI::Charts::Line.new(opts).render  
    end
  end
end