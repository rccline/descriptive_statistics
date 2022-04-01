set.seed(123)
values <- round(rnorm(100, 100, 2))

# Vector of Values
contingency_table <- table(values)

# Proportion of values in Values
proportion_table <- prop.table(contingency_table)

table_all <- rbind(contingency_table,
                   proportion_table)

library(kableExtra)
library(dplyr)

table_all %>% 
kbl(caption = "Contingency Table") %>% 
kable_classic(full_width = F, html_font = "Cambria", position = "left")  

table_all %>% 
  sum(proportion_table)
