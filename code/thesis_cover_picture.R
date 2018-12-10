library(ggpomological)
library(tidyverse)

data.frame(x = 1:1000, y = rnorm(1000, mean = 0, sd = 0.1) ) %>%
    ggplot(aes(x = x, y = y) ) +
    geom_line(col = "#2b323f", size = 0.5) +
    xlab("Samples") +
    ylab("EMG amplitude (mV)") +
    #theme_pomological_fancy(base_family = "Myfont", base_size = 20)
    #theme(axis.text.x = element_blank(), axis.text.y = element_blank() )
    theme_pomological_fancy(base_family = "Homemade Apple", base_size = 12)
