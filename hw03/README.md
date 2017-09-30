README
================
Xinzhe Dong
September 30, 2017

**Here is [the link](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw03/hw03_Rmarkdown.md) to the rendered .md file.** :tada:

**Report of my process**

-   It took me some time to get the number of countries with low life expectancy over time by continent, then I played with dplyr functions and I finally figured out.

-   When I tried to get the abundance of countries with low life expectancy over time by continent, the continents with 0 countries of low life expectancy on that year has no entry, i.e. the value zero is lost when I do summarize(). Therefore there is no entries for "Oceania" in my whole table because Oceania does not have countries with low life expectancy over the data collection period. I am just wondering if there is a way to make summarize() keep the entries with value 0.

-   The other exploration of the gapminder data with the *dplyr* and *ggplot2* package went well, we covered everything in class.

-   When I worked on getting table and figure side-by-side, I used the given code but the table and figure are not side by side, I did not figure out how to fix it.

-   I referred to this [webpage](https://cran.r-project.org/web/packages/pander/README.html) when I was working on making a table with pander package.
