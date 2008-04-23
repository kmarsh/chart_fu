chart_fu is a charting library for Ruby with multiple backend support and easy, convention over configuration, data access.

== Examples

The simplest thing that could possibly work:

    <%= chart_fu Post %>
  
Would give you a Google Chart with the number of posts created per day.

Adding a few more options:
  
    <%= chart_fu Post, :title => "Posts Over Time", :from => 1.week.ago %>

== Principles

chart_fu aims to be civil when collecting and displaying charts, using sensible defaults that will create meaningful, pleasing, and readable output.
    
== Backends

chart_fu doesn't generate charts on its own, but rather acts as a standard frontend to whatever charting library you choose. This means only having to write charting code once and only once.

 * Google Chart API (via http://gchartrb.rubyforge.org/) - default
 * Gruff (http://nubyonrails.com/pages/gruff)
 * Chart Director (http://www.advsofteng.com/)
 * Open Flash Chart (http://teethgrinder.co.uk/open-flash-chart/)
 
 
== Inspiration

The inspiration for chart_fu came from the pain of switching charting libraries 3 times on [lifemetric](http://lifemetric.com) and spending way too much time trying to get simple charts done.