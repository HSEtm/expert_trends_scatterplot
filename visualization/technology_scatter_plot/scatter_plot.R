
table <- read.table("data.csv", header= TRUE, sep = '\t', quote= "\"", encoding="UTF-8",  stringsAsFactors=FALSE)

color <- table[[1]]
technology <- table[[2]]
russian_level <- table[[3]]
russian_importance <- table[[4]]
priority_area <- table[[5]]
thematic_area <- table[[6]]

technology <- paste(toupper(substring(technology, 1,1)),substring(technology, 2), sep = "")

plot(russian_level, russian_importance,
     xlim = c(0,4.0),
     col= color, pch = 19, cex = 1, lty = "solid", lwd = 2)


text(russian_level, russian_importance, technology, cex= 0.45)



//win.metafile("scatter_plot.wmf", width = 1400, height = 871)
//dev.off()


