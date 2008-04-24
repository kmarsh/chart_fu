module ChartFu
  module Charts
    class Base
      attr_accessor :opts
      attr_accessor :title
      attr_accessor :labels
      attr_accessor :data
      attr_accessor :width, :height
      attr_accessor :legend
      
      def initialize(opts)
        @opts = opts
        @title  = opts[:title]
        @labels = opts[:labels]
        @data   = opts[:data]
        @width  = opts[:width]
        @height = opts[:height]
        @legend = opts[:legend]
      end
    end
  end
end