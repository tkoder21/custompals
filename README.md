Package with some custom palettes for R plots.
install with GitHub:
# install.packages("devtools")
devtools::install_github("tkoder21/custompals")

list_palettes() to list the available palettes.

Add more palettes by modifying code in data-raw. Remember to run

source("./custompals/data-raw/palettes.R")
devtools::document()
devtools::install("./custompals")   # or push + install_github again after adding new palettes.

Try pal("paletteName") to preview swatch.

Usage instructions in ggplot:
library(ggplot2)
ggplot(diamonds, aes(cut, price, fill = cut)) +
    geom_bar(stat = "summary") +
    scale_fill_custompal("springFloral")+
    scale_color_custompal("springFloral")
