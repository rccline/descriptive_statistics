data1 <- data.frame(x = 1:5,
                    y = 1:5) 

data2 <- data.frame(x1 = 5:1,
                    x2 = 9:5,
                    x3 = 7)
data3 <- data.frame(x4 = rnorm(n=25, mean = 39.74, sd = 25.09),
                    z = scale(rnorm(n=25, mean = 39.74, sd = 25.09)) )


# xlsx:  write data to worksheet ------------------------------------------



xlsx::write.xlsx2(data1, paste0(here::here("data/data_all.xlsx")), row.names=FALSE, sheetName = "data1")
xlsx::write.xlsx2(data2, paste0(here::here("data/data_all.xlsx")), row.names=FALSE, sheetName = "data2")
xlsx::write.xlsx2(data3, paste0(here::here("data/data_all.xlsx")), row.names=FALSE, sheetName = "data3")
my_path 


# Using openxlsx:   Create Workbood + Add Sheet +  Add Data + Save --------



wb <- openxlsx::createWorkbook() 
openxlsx::addWorksheet(wb, sheetName = "data1")
openxlsx::writeData(wb, "data1", data1)

openxlsx::addWorksheet(wb, sheetName = "data2")
openxlsx::writeData(wb, "data2", data2)

openxlsx::addWorksheet(wb, sheetName = "data3")
openxlsx::writeData(wb, "data3", data3) 

openxlsx::saveWorkbook(wb, file= "./data/data.xlsx", overwrite = TRUE) 


# Load Excel File -- Add Sheet + Add Data + saveWorkbook --------------------------------------------

wb2 <- openxlsx::loadWorkbook(here::here("data/nhanes.xlsx"))

openxlsx::addWorksheet(wb2, sheetName = "data_zscore")
openxlsx::writeData(wb2, "data_zscore", data3) 

openxlsx::saveWorkbook(wb2, file= "./data/nhanes.xlsx", overwrite = TRUE) 
