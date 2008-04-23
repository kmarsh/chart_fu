chart_fu is a charting library for Ruby with multiple backend support and easy, convention over configuration, data access.

Examples
========

The simplest thing that could possibly work:

    <%= chart_fu Post %>
  
Would give you a Google Chart with the number of posts created per day.

Adding a little more options:
  
    <%= chart_fu Post, :title => "Posts Over Time", :from => 1.week.ago %>