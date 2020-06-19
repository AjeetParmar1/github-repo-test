library(dslabs)
library(tidyverse)
library(ggthemes)
library(ggrepel)

data(murders)

murders %>% ggplot(aes(population/10^6, total, label = abb)) + 
  geom_point(aes(col = region), size = 3) +
  geom_text_repel() + 
  scale_x_log10() +
  scale_y_log10() + 
  xlab("Population in millions") +
  ylab("Total number of murders") +
  ggtitle("US murder rates per state") + 
  scale_color_discrete(name = "Region:", labels = c("NE", "S", "NC", "W")) + 
  theme_economist()

