module ChartFu
  module Backends
    module GoogleChartAPI
      module Charts
        class Line
          
          attr_accessor :title
          attr_accessor :labels
          attr_accessor :data
          attr_accessor :width, :height
          
          attr_accessor :google_chart
          
          def initialize(opts)
            @title  = opts[:title]
            @labels = opts[:labels]
            @data   = opts[:data]
            @width  = opts[:width]
            @height = opts[:height]
            @legend = opts[:legend]
            
            @google_chart = GoogleChart::LineChart.new("#{@width}x#{@height}", @title)
            
            @google_chart.show_legend = opts[:legend]
            
            if @data.is_a?(Hash)
              @data.each do |key, values|
                @google_chart.data key, values                
              end
            else
              @google_chart.data nil, @data
            end
            
            @google_chart.axis :x, :labels => @labels
          end
          
          def render
            #return "<img src=\"http://chart.apis.google.com/chart?chxt=x,y&chxl=0:|#{@labels.join("|") if @labels}|1:|0|100&cht=lc&chd=s:cEAELFJHHHKUju9uuXUc&chco=76A4FB&chls=2.0&chs=#{@width}x#{@height}\" title=\"#{@title}\" alt=\"#{@title}\">"
            return "<img src=\"#{@google_chart.to_url}\" />"
          end
        end
      end
    end
  end
end