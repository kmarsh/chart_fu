module ChartFu
  module Backends
    module GoogleChartAPI
      module Charts
        class Line
          
          attr_accessor :title
          attr_accessor :labels
          attr_accessor :data
          attr_accessor :width, :height
          
          def initialize(opts)
            @title  = opts[:title]
            @labels = opts[:labels]
            @data   = opts[:data]
            @width  = opts[:width]
            @height = opts[:height]
          end
          
          def render
            return "<img src=\"http://chart.apis.google.com/chart?chxt=x,y,r,x&chxl=0:|Jan|July|Jan|July|Jan|1:|0|100|2:|A|B|C|3:|2005|2006|2007&cht=lc&chd=s:cEAELFJHHHKUju9uuXUc&chco=76A4FB&chls=2.0&chs=#{@width}x#{@height}\" title=\"#{@title}\" alt=\"#{@title}\">"
          end
        end
      end
    end
  end
end