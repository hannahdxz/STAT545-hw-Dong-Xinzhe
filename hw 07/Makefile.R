## one script to rule them all

## clean out any previous work
outputs <- c("gapminder.tsv",                                 # 00_download-data.R
	     "gapminder_reorder.tsv",                               # 01_filter-reorder-plot.R
	     "countries_in_each_continent_with_large_se.tsv",       # 02_statistical_analysis.R
	     list.files(pattern = "*.png$"))
file.remove(outputs)

## run my scripts
source("00_download-data.R")
source("01_filter-reorder-plot.R")
source("02_statistical_analysis.R")
