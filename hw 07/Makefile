## one Makefile to make them all

all: 03_gap-report.html

clean:
	rm -rf *.tsv *.png 0*.md *.html 03_gap-report_files 
	
#gapminder.tsv:
#	curl -L https://raw.githubusercontent.com/jennybc/gapminder/master/inst/extdata/gapminder.tsv >gapminder.tsv

gapminder.tsv:
	Rscript 00_download-data.R

gapminder_reorder.tsv boxplot_of_lifeExp_and_continents.png 01_filter-reorder-plot.html: 01_filter-reorder-plot.R gapminder.tsv
	Rscript -e "rmarkdown::render('01_filter-reorder-plot.R')"

estimated_intercepts_slopes_and_sd.tsv: gapminder_reorder.tsv 02_statistical_analysis.R
	Rscript 02_statistical_analysis.R
	rm Rplots.pdf
	
03_gap-report.html: 03_gap-report.Rmd gapminder.tsv gapminder_reorder.tsv
	Rscript -e "rmarkdown::render('03_gap-report.Rmd')"
