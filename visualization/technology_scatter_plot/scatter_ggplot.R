install.packages("ggplot2")
install.packages("ggrepel")

library(ggplot2)
library(ggrepel)

table <- read.table("data.csv", header= TRUE, sep = '\t', quote= "\"", encoding="UTF-8",  stringsAsFactors=FALSE)

color <- table[[1]]
technology <- table[[2]]
russian_level <- table[[3]]
russian_importance <- table[[4]]
priority_area <- table[[5]]
thematic_area <- table[[6]]

color <- unique(color, incomparables = FALSE)

technology <- paste(toupper(substring(technology, 1,1)),substring(technology, 2), sep = "")

data <- data.frame(color, technology, russian_level, russian_importance, priority_area, thematic_area)

ggplot(data, # data frame
       aes(x = russian_level,
           y = russian_importance,
           color = priority_area,
           label = technology)) +
  geom_point() + 
  geom_text(color = 'black',
         check_overlap = TRUE) +
  labs(color = "Приоритетные направления научно-технологического развития РФ",
       x = "Уровень российских разработок по сравнению с мировым",
       y = "Значимость технологии для России") +
  scale_color_manual(values=color) +
  theme(legend.position = "bottom") +
  lims(x=c(1,4),y=c(1,4.5)) +
  geom_vline(xintercept = 2.5) + geom_hline(yintercept = 2.75)