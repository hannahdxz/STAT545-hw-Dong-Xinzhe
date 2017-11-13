# 03_gap-report
Xinzhe Dong  
November 12, 2017  

This is an R Markdown document. In this example, its purpose is to allow us to demonstrate how to use `rmarkdown::render()` without the help of RStudio's buttons. We will, in fact, call `rmarkdown::render()` from within a `Makefile`.


```r
library(ggplot2)
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(forcats)

# bring the data in as data frame
gapminder <- read.delim("gapminder_reorder.tsv")

## make some plots

# a boxplot of lifeExp and continents
p1 <- ggplot(gapminder, aes(x = continent, y = lifeExp, color=continent)) + geom_boxplot()
ggsave("boxplot_of_lifeExp_and_continents.png", p1)
```

```
## Saving 7 x 5 in image
```
