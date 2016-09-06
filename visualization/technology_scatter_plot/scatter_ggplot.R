install.packages("ggplot2")
install.packages("ggrepel")

library(ggplot2)
library(ggrepel)

table <- read.table("data.csv",
                    header= TRUE,
                    sep = '\t',
                    quote= "\"",
                    encoding ="UTF-8",
                    stringsAsFactors =FALSE)

table$technology <- paste(toupper(substring(table$technology, 1,1)),
                          substring(table$technology, 2), sep = "")


x_lim <- c(floor(min(table$russian_level)),
           ceiling(max(table$russian_level)))

y_lim <- c(floor(min(table$russian_importance)),
           ceiling(max(table$russian_importance)))

ggplot(table, # data frame
       aes(x = russian_level,
           y = russian_importance,
           color = priority_area,
           label = technology)) +
    geom_point() +
    geom_text(color = 'black',
              check_overlap = TRUE) +
    labs(color = "color legend",
         x = "x legend",
         y = "y legend") +
    scale_color_manual(values = unique(table$color, incomparables = FALSE)) +
    theme(legend.position = "bottom") +
    lims(x = x_lim, y = y_lim) +
    geom_vline(xintercept = mean(x_lim)) +
    geom_hline(yintercept = mean(y_lim))