# BarChart Application

Expense Management are the basic unit component in order to keep track of project-related costs incurred by project members while traveling, using public transit on company time, or hosting clients for business related purposes.  

I am showing the current_month and last_month expenses using barchart.

I am using Ruby version 2.6.0, but it will work on the lower versions as well as it does not has any dependencies.

I am using Rails version 5.2.4.1, but it will work on the lower Rails versions as well.

I am using sqlite3 for database.

I am using "chartkick gem" for showing all the expenses.

Add gem "chartkick" and run bundle install.

Add "//= require chartkick" in application.js

Add this in application.html.erb

    <%= javascript_include_tag "//www.google.com/jsapi" %>
    <%= javascript_include_tag "application", "chartkick" %>
    <%= javascript_include_tag "https://www.gstatic.com/charts/loader.js" %>

