module ChartFu
  module Charts
    class Line < Base      
      def format_axis
        
      end
      
      def render
        Backends::GoogleChartAPI::Charts::Line.new(@opts).render
      end
    end
  end
end