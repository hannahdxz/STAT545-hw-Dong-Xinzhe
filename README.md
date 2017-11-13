# STAT545-hw-Dong-Xinzhe

## Homeworks:


|    **Homework**    |    **rendered .md file**   |  **Status**   |
|--------------------|---------------------------|---------------|
| [hw01](https://github.com/hannahdxz/STAT545-hw01-Dong-Xinzhe) Edit README.md and Use R Markdown|[hw01.md](https://github.com/hannahdxz/STAT545-hw01-Dong-Xinzhe/blob/master/hw01_gapminder.md)   |:white_check_mark:|
| [hw02](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/tree/master/hw%2002) Explore Gapminder and use dplyr| [hw02.md](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2002/hw-02_Rmarkdown.md)   |:white_check_mark:|
| [hw03](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/tree/master/hw03) Use dplyr to manipulate and explore data (also use ggplot2)| [hw03.md](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw03/hw03_Rmarkdown.md) |:white_check_mark:|
| [hw04](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/tree/master/hw04) Tidy data and joins|  [hw04.md](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw04/hw04.md)|:white_check_mark:|
| [hw05](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/tree/master/hw05) Factor and figure management; Repo hygiene| [hw05.md](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw05/hw05.md)|:white_check_mark:|
| [hw06](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/tree/master/hw%2006) Data wrangling wrap up| [hw06.md](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/blob/master/hw%2006/hw06.md)|:white_check_mark:|
| [hw07](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/tree/master/hw%2007) Automating Data-analysis Pipelines| [hw07.md](https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/tree/master/hw%2007)|:white_check_mark:|




## Contents of homeworks:
**hw01** : 

* Create a New Repo, and edit README.md as a self introduction
* Add R Markdown and Markdown for Gapminder exploration

**hw02** :

* Explore the data, get to know the variables
* Explore various plot types with `ggplot2`
* Use `filter()`, `select()` and `%>%`
       
**hw03** :

* Manipulate and explore a dataset with the `dplyr` package
* Visualizations made with `ggplot2`
       
**hw04** :

* Reshape a data frame using `gather()` and `spread()` function from `tidyr`
* Practice `join()` functions
       
**hw05** :

* Reorder a factor using the `forcats` package, and explore its effects on figures 
* Improve a figure made previously, implement visualization design principles
* Write some data to file and load it back into R using `write_csv()`/`read_csv()`, and `saveRDS()`/`readRDS()`
* Writing figures to file using `ggsave()`

**hw06** :

* Writing functions. Write two functions that do linear regression and robust regression on the Gapminder data, and compare their estimated mean square prediction error (mspe).

* Work with a nested data frame. Create a nested data frame using the function `nest()` and map a function over the list column holding the nested data. Get information out of the linear models using the `tidy()` functions. Use the usual `dplyr`, `tidyr`, and `ggplot2` workflows to make explorations.

* Working on some of the exercises from the [Strings chapter](http://r4ds.had.co.nz/strings.html). 

**hw07** :

* Write three Rscripts and one Rmarkdown to carry out a small data analysis.

* Build an automated data analysis pipeline. 

* Automate the pipeline using two methods: the master R script `Makefile.R` and `Makefile`.


## Useful links:

* The Link to the main [STAT545 webpage](http://stat545.com/).

* A detailed tutorial about [Rmarkdown](http://rmarkdown.rstudio.com/lesson-1.html).

* A [cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) of Markdown.

* A [ggplot tutorial](https://github.com/jennybc/ggplot2-tutorial/blob/master/gapminder-ggplot2-univariate-quantitative.md).

* A [tutorial](https://cran.r-project.org/web/packages/pander/README.html) about making a table with pander package.

* Jenny's [notes and example](https://github.com/jennybc/lotr-tidy/blob/master/02-gather.md) about the gather() function.

* The tutorial about the [forcats package](https://blog.rstudio.com/2016/08/31/forcats-0-1-0/).
