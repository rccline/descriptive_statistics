# tidyeval functions  
# https://www.youtube.com/watch?v=EpTkT6Rkgbs

library(tidyverse)

mtcars %>% 
  group_by(cyl) %>% 
  summarize(n=n(), mean=mean(mpg)) 


# pass var to {{var}} -----------------------------------------------------



# Embrace the variable with {{var}}
# pas the dots ... for many arguments  

data(mtcars)
car_summary <- function(var){
  mtcars %>% 
  dplyr::group_by({{var}}) %>% 
    summarize(mean= mean(mpg), n=n())
}

car_summary(vs, am)  


# passing ... dots --------------------------------------------------------
car_summary <- function(...){
  mtcars %>% 
    dplyr::group_by(...) %>% 
    summarize(mean= mean(mpg), n=n(), .groups = "drop")
}

car_summary(vs, am, cyl)

# group by a var then pass many things into summarize with  ... dots --------------------------------------------------------
# 23:30 min into 
my_car_summary_dots2 <- function(var, ...){
  mtcars %>% 
    group_by({{var}}) %>% 
    summarize(mean= mean(mpg), n=n(), ..., .groups = "drop")
}

my_car_summary_dots2(cyl, hp_mean=mean(hp), hp_sd=sd(hp)) 



# tidyeval with novel data ------------------------------------------------

var_summary <- function(data, var) {
  data %>% 
  summarise(
    n=n(), 
    min=min({{var}}), 
    max=max({{var}}),
    .groups="drop")
}

mtcars %>% 
  group_by(cyl) %>% 
  var_summary(mpg)

ToothGrowth %>% 
  group_by(supp, dose) %>% 
  var_summary(len)

data("ToothGrowth")  


# tidyeval with .data and "strings" ---------------------------------------

var_summary2 <- function(data, var){
    data %>% 
    summarise(n = n(), 
      min= min(.data[[var]]),
      max= max(.data[[var]]),
  .groups = "drop")
}  

mtcars %>% 
  group_by(cyl) %>% 
  var_summary2("mpg")

