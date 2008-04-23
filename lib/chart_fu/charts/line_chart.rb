module ChartFu
  module Charts
    class Line
      attr_accessor :title
      attr_accessor :labels
      attr_accessor :data
      attr_accessor :width, :height
      
      def new(opts)
        @title  = opts[:title]
        @labels = opts[:labels]
        @data   = opts[:data]
        @width  = opts[:width]
        @height = opts[:height]
      end
    end
  end
end