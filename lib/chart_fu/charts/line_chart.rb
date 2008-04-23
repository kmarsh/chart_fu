module ChartFu
  module Charts
    class Line
      attr_accessor :opts
      attr_accessor :title
      attr_accessor :labels
      attr_accessor :data
      attr_accessor :width, :height
      
      def initialize(opts)
        @opts = opts
        @title  = opts[:title]
        @labels = opts[:labels]
        @data   = opts[:data]
        @width  = opts[:width]
        @height = opts[:height]
      end
      
      def format_axis
        
      end
      
      def render
        Backends::GoogleChartAPI::Charts::Line.new(@opts).render
      end
    end
  end
end