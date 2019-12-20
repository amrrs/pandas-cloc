options(scipen = 999)
library(tidyverse)

ggplot(pandas, aes(fct_reorder(Language,code),code, fill = Language)) + geom_bar(stat = "identity")  +
        scale_fill_viridis_d(guide=FALSE) +
        scale_y_log10() +
        coord_flip() +
        ggrepel::geom_label_repel(aes(label = code),label.padding = 0.5,    arrow = arrow(length = unit(0.02, "npc")),
                                  colour = "gray20",
                                  size=4.5, vjust = -0.1,
                                  nudge_y      = 0.25,
                                  direction    = "y",
                                  angle        = 90,
                                  segment.size = 0.2,
                                  fill = "white") +

        theme_minimal() +
        theme(
                plot.title = element_text(color="black", size=16, face="bold"),
                axis.text.y = element_text(color="black", size=10, face="bold"),
                plot.caption = element_text(color="grey", size=8, face="italic")
        ) +
        labs(title = "Languages in Python Pandas Project",
             subtitle = "using cloc",
             caption = "Data Source: https://github.com/pandas-dev/pandas",
             y = "Log of # Code Line Count ",
             x = "Language")
