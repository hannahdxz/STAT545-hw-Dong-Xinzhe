README
================
Xinzhe Dong
November 18, 2017

This week we created the BC Liquor Store app in class. :beer: :cocktail: :wine_glass:

In this homework, I will add more features to this app and publish it on `shinyapps.io`.

**Here is [the link](https://hannahdxz.shinyapps.io/hw_08_liquor_webpage/) to the app on `shinyapps.io`**

**R code for the app:**

* [server.R](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2008/server.R)
* [ui.R](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2008/ui.R)
* [app.R](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2008/app.R)

**Here are the features I added:**

* Add an option to sort the results table by price.
* Add an image of the BC Liquor Store to the UI.
* Use the `DT` package to turn the current results table into an interactive table.
* Add parameters to the plot, so that the user can decide on the colours of the bars in the plot.
* Fix the issue that the app behaves strangely when the user selects filters that return 0 results.
* Use `shinythemes` package to alter the appearance of the app.
* Show the number of results found whenever the filters change.
* Allow the user to download the results table as a .csv file.
* Allow the users to add text input to choose country.
* Provide a way for the user to show results from all countries. If the user does not type in anything in the "Select by Country" box, the table will show the result from all countries.

