This repository is dedicated to demonstrating tools for creating descriptive statistics to render data summaries, frequency tables, etc.  


1. `tabbycat` is a small library of functions for tabulating and summarising categorical variables. Most of the functions are designed to work with dataframes, and use the tidyverse idiom of taking the dataframe as the first argument so they work within pipelines. Equivalent functions that operate directly on vectors are also provided where it makes sense. Folder `tabbycat` includes:  

* counting functions  
* jaccard similarity test  

2. docs_descriptive folder:   
* Frequency tabless from `summarytools package`;  
* pastecs package;` and `  
* skimr package` are described in docs_descriptive folder.  
* Cumulative frequency distribution examples   

3. Scripts Folder  
* Sample scripts from *openxlsx* package.
  - create workbook object  
  - add sheet  
  - add data to sheet  
  - insertPlot to sheet  
  - saveWorkbook 
* create_distributions.R 
  - Create z scores with scale
  - coerce z score matrix to vector with as.numeric()
  - rnorm: random number generation
  - dnorm: density or probability mass function
  - pnorm: cumulative distribution: *convert z scores to probability*
  - qnorm: quantiles
  


