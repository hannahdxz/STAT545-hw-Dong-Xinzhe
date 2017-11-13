README
================
Xinzhe Dong
November 13, 2017

In this assignment, I will build an automated data analysis pipline using two methods: the master R script `Makefile.R` and `Makefile`. Here is the [link](http://stat545.com/hw07_automation.html) to the homework on the course webpage.

**Link to Project files:**

**R scripts:**

[`00_download-data.R`](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2007/00_download-data.R) download the raw data for our example, `gapminder.tsv`.

[`01_filter-reorder-plot.R`](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2007/01_filter-reorder-plot.R) \* Bring the data in as data frame. \* Make some plots, save to file a boxplot of lifeExp and continents, and a scatterplot of lifeExp vs. year. \* Reorder Gapminder continents by minimum of lifeExp, and write the reordered data to file.

[`02_statistical_analysis.R`](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2007/02_statistical_analysis.R) \* Fit a linear regression of life expectancy on year within each country. Write the estimated intercepts, slopes, and residual error variance (or sd) to file. \* Create a scatterplots of life expectancy vs. year for the 4 countries with large sd found in each continent, faceting on countries, fitted line overlaid, and write these plots to file.

[`03_gap-report.Rmd`](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2007/03_gap-report.Rmd) \* a Rmarkdown document. \* Its purpose is to allow us to demonstrate how to use `rmarkdown::render()` without the help of RStudio's buttons. We will call `rmarkdown::render()` from within a `Makefile`.

**Master R scripts:**

[`Makefile.R`](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2007/Makefile.R) is a master R script that simply `source()`s the three scripts(`00_download-data.R`, `01_filter-reorder-plot.R`, and `02_statistical_analysis.R`), one after the other, with a second “clean up / reset” script that deletes all the output the scripts leave behind.

[`render_r_scripts.R`](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2007/render_r_scripts.R) render the `Makefile.R` and emulate RStudio’s “Compile Notebook” button.

**Makefile:**

[`Makefile`](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2007/Makefile) to automate the pipeline using `make`. \* run the R scripts (`00_download-data.R`, `01_filter-reorder-plot.R`, `02_statistical_analysis.R`,`03_gap-report.Rmd`) \* render an R script, use `Rscript -e "rmarkdown::render('01_filter-reorder-plot.R')"` \* render an RMarkdown report, use `Rscript -e "rmarkdown::render('03_gap-report.Rmd')"`
