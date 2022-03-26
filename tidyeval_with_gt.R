

# gtExtras::gt_add_divider(), simplified ----------------------------------

library(gt)
library(tidyverse)

gt_add_divider <- function(gt_object, columns, ..., include_labels=TRUE) {
  stopifnot("Table must be of class 'gt_tbl'" = "gt_tbl" %in% class(gt_object))
  
  gt_object %>% 
    tab_style(
      # dots include passed named aruments to the internal function
      style = cell_borders(sides= "right", ...),
      locations= if(isTRUE(include_labels)) {
        # columns to affect
        list(cells_body(columns = {{ columns}}),
             cells_column_labels(columns = {{ columns }}))
      } else {
        cells_body(columns = {{ columns }})
      }
    )
      }
   
basic_table <- head(mtcars, 6) %>% 
  gt() 

basic_table %>% 
  gt_add_divider(cyl, weight = px(2), color = "red")


basic_table %>% 
  gt_add_divider(c(cyl,mpg), weight = px(3), color = "lightgrey", include_labels = FALSE)

