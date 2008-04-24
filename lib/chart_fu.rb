require 'chart_fu/charts/base'
require 'chart_fu/charts/line_chart'
require 'chart_fu/charts/pie_chart'
require 'chart_fu/charts/scatter_chart'
require 'chart_fu/charts/bar_chart'

require 'chart_fu/backends/google_chart_api_backend'

puts "** chart_fu loaded"

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

      opts[:width]  = 240 if opts[:width].blank?
      opts[:height] = 100 if opts[:height].blank?
      opts[:title]  = "" if opts[:title].blank?
      opts[:format] = Hash.new({})
      # opts[:format][:]
      
      # Build up a graph based on what data we have
      case data.class.to_s
        # TODO: Better test if +model+ really is an AR model
        when 'Class'
          # time-series line chart of +DATE(created_at)+ values
          # TODO: Depending on zoom level, pull weeks or months or years
          d = data.send(:count, :group => "DATE(created_at)", :order => "created_at")

          return if d.empty?

          points = d.size
          min_date, max_date = d.keys.first, d.keys.last
          range = (Date.parse(max_date) - Date.parse(min_date)).to_i              # days
          point_density = (opts[:width].to_f / points.to_f)
          
          puts "points: #{points}, range: #{range}, point_density: #{point_density}"
          
          # Based on the number of results we get back, and how far apart they
          # are, we may want to pull less-specific data. There are a few
          # possibilities:
          case range
            when 0..7
              
            when 8..30

            when 31..90
              
            when 91..180
              
            else
              
          end
          
          # Format the date axis based on:
          #   1. how many data points we have,
          #   2. how wide the graph is, and
          #   3. how much time is between the min and max
          
          date_format = case point_density
            when 0..30
              '%b'

            when 31..60
              '%m/%Y'

            when 61..90
              '%m/%d/%Y'

            when 91..120
              '%m/%d/%Y'

            else
              ''
          end
          
          opts[:labels] = d.keys.map {|key| Date.parse(key).strftime(date_format) }
          opts[:data]   = d.values
          opts[:legend] = false            
          
          Charts::Line.new(opts).render
          
        when 'Array'
          # ambiguous x-axis line chart
          opts[:data]   = data
          opts[:labels] = []
          opts[:legend] = false
          
          Charts::Line.new(opts).render
          
        when 'Hash'
          if data.keys.all? {|k| k.is_a?(Date) || k.is_a?(Time) }
            # time-series line chart
            opts[:labels] = data.keys
            opts[:data]   = d.values
            opts[:legend] = false
          
            Charts::Line.new(opts).render
            
          elsif data.values.all? {|v| v.is_a?(Array)}
            # multi-axis line graph
            opts[:data]   = data
            opts[:labels] = []
            opts[:legend] = true
          
            Charts::Line.new(opts).render
          
          else
            # pie chart
            
          end
      end
    end
  end
end