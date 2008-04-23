module ChartFu
  module Backends
    module GoogleChartAPI
      module Charts
        class Line
          def new(*opts)
            @opts = opts
          end
          
          def included(base)
            puts "included: #{base.inspect}"
          end
          
          def render
            return helper.image_tag "http://chart.apis.google.com/chart?chxt=x,y,r,x&chxl=0:|Jan|July|Jan|July|Jan|1:|0|100|2:|A|B|C|3:|2005|2006|2007&cht=lc&chd=s:cEAELFJHHHKUju9uuXUc&chco=76A4FB&chls=2.0&chs=200x125", @opts[:title]
          end
        end
      end
    end
  end
end