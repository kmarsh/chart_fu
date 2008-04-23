chart_fu is a charting library for Ruby with multiple backend support and easy, convention over configuration, data access.

Examples
========

The simplest thing that could possibly work:

    <%= chart_fu Post %>
  
Adding a little more options:
  
    <%= chart_fu Post, :title => "Posts Over Time", :from => 1.week.ago %>