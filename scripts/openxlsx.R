##%######################################################%##
#                                                          #
####    openxlsx Package for R References: R-Ladies     ####
####     Baltimore Presentation by  [Johns Hopkins      ####
####            University graduate student             ####
####  Alyssa Columbus](https://alyssacolumbus.com) and  ####
####          [CradleToGrave Youtube Tutorial           ####
####                      for the                       ####
####                      Openxlsx                      ####
####             Package](https://www.youtu             ####
####            be.com/watch?v=MdhSxQmm4ZU)             ####
#                                                          #
##%######################################################%##


# library(openxlsx)
library(tidyverse)

class(mtcars)
mtcars <- data(mtcars) 

mtcars <- mtcars
class(mtcars)
summary(mtcars)
plot(scale(mtcars$mpg))
mpgZ <- scale(mtcars$mpg)
plot(density(mpgZ))



# openxlsx createWorkbook, addWorksheet, writeData, insertPlot, saveWorkbook --------

wb <- openxlsx::createWorkbook()

openxlsx::addWorksheet(wb, sheetName = "mtcars")
openxlsx::writeData(wb, "mtcars", mtcars)

openxlsx::addWorksheet(wb, sheetName = "Z score Density")
plot(density(mpgZ))
openxlsx::insertPlot(wb, sheet = "Z score Density")
openxlsx::saveWorkbook(wb, file = here::here("data","mtcars.xlsx"), overwrite = TRUE)



