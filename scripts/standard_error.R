##%######################################################%##
#                                                          #
####  Standard error of mean versus standard deviation  ####
####                 In scientific and                  ####
####        technical literature,  experimental         ####
####      data are often summarized either  using       ####
####       the mean and standard deviation of the       ####
####           sample data or  the mean with            ####
####       the standard error.  This often leads        ####
####                 to confusion about                 ####
####        their interchangeability.  However,         ####
####               the mean and standard                ####
####       deviation are descriptive statistics,        ####
####          whereas the standard error of the         ####
####     mean is descriptive of the random sampling     ####
####   process. The standard deviation of the sample    ####
####       data is a description of the variation       ####
####    in measurements, while the standard error of    ####
####    the mean is a probabilistic statement about     ####
####         how the sample size will provide a         ####
#### better bound on estimates of the population mean,  ####
####     in light of the central limit theorem.[7]      ####
####          Put simply, ***the standard error of      ####
####         the sample mean is an estimate of          ####
####         how far the sample mean is likely          ####
####          to be from the population mean,           ####
####    whereas the standard deviation of the sample    ####
####     is the degree to which individuals within      ####
####     the sample differ from the sample mean.[8]     ####
####  If the population standard deviation is finite,   ####
####           the standard error of the mean           ####
####          of the sample will tend to zero           ####
####     with increasing sample size,  because the      ####
####   estimate of the population mean will improve,    ####
####         while the standard deviation of the        ####
####   sample will tend to approximate the population   ####
####  standard deviation as the sample size increases.  ####
# https://en.wikipedia.org/wiki/Standard_error             #                                                         #
##%######################################################%##

####              the standard error of                 ####
####         the sample mean is an estimate of          ####
####         how far the sample mean is likely          ####
####          to be from the population mean            ####


x <- c( 4, -1, 7, -4, 6, 8, 10)   

standard_error <- function(x) {
  sd(x)/sqrt(length(x))
}

standard_error(x)

library(plotrix)

std.error(x)

ls("package:plotrix")
