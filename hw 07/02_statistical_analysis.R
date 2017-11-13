library(ggplot2)
library(plyr)
library(dplyr)
library(broom)
library(tidyverse)

# import the data created in the first script
gapminder <- readRDS("gapminder_reorder.tsv")

## make sure the new continent order is still in force
gapminder%>%
  group_by(continent)%>%
  summarise(min(lifeExp))

## Fit a linear regression of life expectancy on year within each country. 
## Write the estimated intercepts, slopes, and std.error to file. 
le_l_yr <- function(df) {
  lm(lifeExp ~ I(year - 1950), data = df)
}

gap_nested2 <- gapminder %>% 
  group_by(continent, country) %>% 
  nest()

gap_coefs2 <- gap_nested2 %>% 
  mutate(fit = map(data, le_l_yr),
         tidy = map(fit, tidy)) %>% 
  dplyr::select(continent, country, tidy) %>% 
  unnest(tidy)

gap_coefs2 <- gap_coefs2 %>%
  mutate(term = recode(term,
                       `(Intercept)` = "intercept",
                       `I(year - 1950)` = "slope"))

gap_ests2 <- gap_coefs2 %>% 
  dplyr::select(continent:std.error) %>% 
  spread(key = term, value = estimate)

write.table(gap_ests2,
            "estimated_intercepts_slopes_and_sd.tsv", quote = FALSE,
            sep = "\t", row.names = FALSE)

## Find the 3 or 4 “worst” and “best” countries for each continent.
## I will choose 4 countries in each continent with the largest std.error as the "worst" 
## countries. Since large residual std.error indicates that the linear model fit the data poorly.

large_sd_africa <- gap_ests2%>%
  filter(continent=="Africa")%>%
  arrange(desc(std.error))

country_africa <- head(large_sd_africa,4)[,c("continent","country","std.error")]


large_sd_asia <- gap_ests2%>%
  filter(continent=="Asia")%>%
  arrange(desc(std.error))
country_asia <- head(large_sd_asia,4)[,c("continent","country","std.error")]

  
large_sd_america <- gap_ests2%>%
  filter(continent=="Americas")%>%
  arrange(desc(std.error))
country_america <- head(large_sd_america,4)[,c("continent","country","std.error")]


large_sd_europe <- gap_ests2%>%
  filter(continent=="Europe")%>%
  arrange(desc(std.error))
country_europe <- head(large_sd_europe,4)[,c("continent","country","std.error")]


country_large_se <- list(country_africa,country_asia,country_america,country_europe) %>%
  Reduce(function(dtf1,dtf2) full_join(dtf1,dtf2,by = c("continent", "country", "std.error")), .)

## Create a figure for each continent, and write one file per continent, 
## with an informative name. The figure should give scatterplots of 
## life expectancy vs. year for the 4 countries found above in each continent,
## faceting on country, fitted line overlaid.

# for Africa
p_africa <- gapminder%>%
  filter(country %in% c("Zimbabwe", "Swaziland","Rwanda","Botswana"))%>%
  ggplot(aes(x = year, y=lifeExp)) + geom_point() + geom_smooth(se=FALSE, method="lm") +
  facet_wrap(~ country) + 
	labs(title="scatterplots of lifeExp vs. year for 4 countries with large sd in Africa")
ggsave("countries_in_Africa_with_large_se.png", p_africa)

# for Asia
p_asia <- gapminder%>%
  filter(country %in% c("Cambodia", "Iraq","Korea, Dem. Rep.","China"))%>%
  ggplot(aes(x = year, y=lifeExp)) + geom_point() + geom_smooth(se=FALSE, method="lm") +
  facet_wrap(~ country) + 
	labs(title="scatterplots of lifeExp vs. year for 4 countries with large sd in Asia")
ggsave("countries_in_Asia_with_large_se.png", p_asia)

# for Americas
p_americas <- gapminder%>%
  filter(country %in% c("Jamaica", "El Salvador","Cuba","Trinidad and Tobago"))%>%
  ggplot(aes(x = year, y=lifeExp)) + geom_point() + geom_smooth(se=FALSE, method="lm") +
  facet_wrap(~ country) + 
	labs(title="scatterplots of lifeExp vs. year for 4 countries with large sd in Americas")
ggsave("countries_in_Americas_with_large_se.png", p_americas)

# for Europe
p_europe <- gapminder%>%
  filter(country %in% c("Montenegro", "Bulgaria","Bosnia and Herzegovina","Albania"))%>%
  ggplot(aes(x = year, y=lifeExp)) + geom_point() + geom_smooth(se=FALSE, method="lm") +
  facet_wrap(~ country) + 
	labs(title="scatterplots of lifeExp vs. year for 4 countries with large sd in Europe")
ggsave("countries_in_europe_with_large_se.png", p_europe)


