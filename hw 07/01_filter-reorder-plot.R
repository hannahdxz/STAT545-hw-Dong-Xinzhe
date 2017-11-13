library(ggplot2)
library(dplyr)
library(forcats)

# bring the data in as data frame
gapminder <- read.delim("gapminder.tsv")

## make some plots

# a boxplot of lifeExp and continents
p1 <- ggplot(gapminder, aes(x = continent, y = lifeExp, color=continent)) + geom_boxplot()
ggsave("boxplot_of_lifeExp_and_continents.png", p1)

# a scatterplot of lifeExp vs. year
p2 <- ggplot(gapminder, aes(x=year, y=lifeExp)) + geom_point(aes(color=continent),alpha=0.5)
ggsave("scatterplot_of_lifeExp_vs._year.png", p2)

## reorder Gapminder continents by minimum of lifeExp.
new_continent<-fct_reorder(gapminder$continent, gapminder$lifeExp, min)

## implement the new continent ordering, 
## order the data frame by year, then by life expectancy,
## rearrange the variables so that year comes first, followed by life expectancy,
## drop least frequent continents
gapminder <- gapminder%>%
  mutate(continent = new_continent)%>%
  arrange(year, lifeExp) %>% 
  select(year, lifeExp, everything())%>%
  filter(continent != "Oceania")%>%
  droplevels()

## write data to file
write.table(gapminder, "gapminder_reorder.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)