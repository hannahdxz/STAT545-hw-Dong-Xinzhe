# hw03
Xinzhe Dong  
September 26, 2017  

### load the packages


```r
library(gapminder)
library(tidyverse)
```

```
## Loading tidyverse: ggplot2
## Loading tidyverse: tibble
## Loading tidyverse: tidyr
## Loading tidyverse: readr
## Loading tidyverse: purrr
## Loading tidyverse: dplyr
```

```
## Conflicts with tidy packages ----------------------------------------------
```

```
## filter(): dplyr, stats
## lag():    dplyr, stats
```

```r
library(knitr)
library(kableExtra)
library(ggplot2)
library(forcats)
```


### 1. Get the maximum and minimum of GDP per capita for all continents.


```r
gapminder %>% 
  group_by(continent) %>% 
  summarize(min_gdpPercap=min(gdpPercap), max_gdpPercap=max(gdpPercap), range = max_gdpPercap - min_gdpPercap)
```

```
## # A tibble: 5 x 4
##   continent min_gdpPercap max_gdpPercap     range
##      <fctr>         <dbl>         <dbl>     <dbl>
## 1    Africa      241.1659      21951.21  21710.05
## 2  Americas     1201.6372      42951.65  41750.02
## 3      Asia      331.0000     113523.13 113192.13
## 4    Europe      973.5332      49357.19  48383.66
## 5   Oceania    10039.5956      34435.37  24395.77
```

#### Plot the max and min of GDP per capita for all continents.

```r
gapminder %>% 
  group_by(continent) %>% 
  summarize(min_gdpPercap=min(gdpPercap), max_gdpPercap=max(gdpPercap))%>%
  ggplot(aes(x = continent)) + 
  geom_point(aes(y = min_gdpPercap)) +
  geom_point(aes(y = max_gdpPercap)) +
  labs(y="Max & Min gdpPercap", title= "Plot of max & min of gdpPercap for all continents") 
```

![](hw03_Rmarkdown_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

#### We observe the followings:

* 1. Both the maximum and minimum of GDP per capita for Africa is the smallest among the five continents.

* 2. Asia has the largest range of GDP per capita.

* 3. Oceania has the largest minimum gdpPercap.



### 2. Look at the spread of GDP per capita within the continents.


```r
# A density plot of gdpPercap
ggplot(gapminder, aes(x = gdpPercap, color = continent)) + geom_density() +
    labs(title= "Density plot of gdpPercap within the continents") 
```

![](hw03_Rmarkdown_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

```r
# boxplots of GDP per capita for all continents. 
ggplot(gapminder, aes(x = continent, y = gdpPercap)) + geom_boxplot() +
      labs(title= "Boxplot of gdpPercap within the continents") 
```

![](hw03_Rmarkdown_files/figure-html/unnamed-chunk-4-2.png)<!-- -->

#### From the above two plots, we observe that:

* 1. Oceania has the largest median of gdpPercap among the five continents. Europe has the second largest median of gdpPercap among the five continents.

* 2. Africa has the smallest median of gdpPercap among the five continents.

* 3. The gdpPercap of Asia is more widely spreaded than the other continents.

* 4. The gdpPercap of the five countries are all skewed to the right. The distribution  of gdpPercap of Oceania is closer to the normal distribution. 



### 3. Compute a weighted mean, weighting by population, of life expectancy for different years. 


```r
gapminder %>% 
  group_by(year) %>% 
  summarize(mean_lifeex=weighted.mean(lifeExp,pop))
```

```
## # A tibble: 12 x 2
##     year mean_lifeex
##    <int>       <dbl>
##  1  1952    48.94424
##  2  1957    52.12189
##  3  1962    52.32438
##  4  1967    56.98431
##  5  1972    59.51478
##  6  1977    61.23726
##  7  1982    62.88176
##  8  1987    64.41635
##  9  1992    65.64590
## 10  1997    66.84934
## 11  2002    67.83904
## 12  2007    68.91909
```

#### Plot the weighted mean of life expectancy vs. year.

```r
gapminder %>% 
  group_by(year) %>% 
  summarize(mean_lifeex=weighted.mean(lifeExp,pop)) %>%
  ggplot(aes(x = year, y = mean_lifeex)) + geom_line() +
      labs(title= "Plot of weighted mean of life expectancy vs. year") 
```

![](hw03_Rmarkdown_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

#### From the plot, we can tell that:

The weighted mean of life expectancy from 1952 to 2007 is increasing at a relatively constant rate. 



### 4. How is life expectancy changing over time on different continents?


```r
ggplot(data = gapminder) + 
  geom_point(mapping = aes(x = year, y = lifeExp)) + 
  facet_wrap(~ continent, nrow = 2) + 
        labs(title= "Plot of life expectancy over time on different continents") 
```

![](hw03_Rmarkdown_files/figure-html/unnamed-chunk-7-1.png)<!-- -->

#### From the plot, we can tell that:

The life expectancy is increasing over time on different continents.



### 5. Report the absolute and/or relative abundance of countries with low life expectancy over time by continent: 

Compute a mean of life expectancy worldwide. Then determine how many countries on each continent have a life expectancy less than the mean life expectancy, for each year.


```r
average_age <- mean(gapminder$lifeExp)
gapminder %>% 
  filter(lifeExp<average_age) %>%
    group_by(continent,year) %>% 
    summarize(No._countries_with_low_lifeExp=length(country))
```

```
## # A tibble: 40 x 3
## # Groups:   continent [?]
##    continent  year No._countries_with_low_lifeExp
##       <fctr> <int>                          <int>
##  1    Africa  1952                             52
##  2    Africa  1957                             52
##  3    Africa  1962                             51
##  4    Africa  1967                             50
##  5    Africa  1972                             50
##  6    Africa  1977                             49
##  7    Africa  1982                             43
##  8    Africa  1987                             39
##  9    Africa  1992                             38
## 10    Africa  1997                             39
## # ... with 30 more rows
```

#### Note:

* If there is no value for a continent on that year. then it means there is no country that year on that continent has a life expectancy less than the mean life expectancy.

* For example: There is no value for the continent "Oceania" in any year, which means Oceania does not have any country which has a life expectancy less than the mean life expectancy during the whole data collection period.

#### Plot the number of countries with low life expectancy over time by continent.


```r
gapminder %>% 
  filter(lifeExp<average_age) %>%
    group_by(continent,year) %>% 
    summarize(No._countries_with_low_lifeExp=length(country)) %>%
    ggplot(aes(x = year, y = No._countries_with_low_lifeExp)) + geom_line() +
      facet_wrap(~ continent, nrow = 2) +
          labs(title= "Plot of number of countries with low life expectancy over time by continent") 
```

![](hw03_Rmarkdown_files/figure-html/unnamed-chunk-9-1.png)<!-- -->

#### From the plots, we can tell that:

* 1. The number of countries with low life expectancy is decreasing over time in each continent.

* 2. There is not plot for Oceania, because Oceania does not have any country which has a life expectancy less than the mean life expectancy during the whole data collection period.

* 3. For Americas and Europe, the number of countries with low life expectancy decreases to zero after a time, so the line on their graph is shorter compare to the line on the graph of Africa and Asia.
