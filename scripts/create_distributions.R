##%######################################################%##
#                                                          #
####                 Distributions  by                  ####
####                    Hector Lopez                    ####
####     https://www.youtube.com/watch?v=hzHaOLyIfzA    ####
#                                                          #
##%######################################################%## 


##%######################################################%##
#                                                          #
####                    Non-Standard                    ####
####                   Distributions                    ####
####            http://math.furman.edu/~tle             ####
####            wis/math30/normal/pnorm.html            ####
#                                                          #
##%######################################################%##

# rnorm (n, mean, var) 

# Normal Distribution Numbers ---------------------------------------------

# r: random number generation
# d: density or probability mass function
# p: cumulative distribution
# q: quantiles

norm <- rnorm(100, mean = 0, sd = 1) 

# generate n random numbers from a normal distribution with given mean & st. dev.
rand <- rnorm(n, mean = 0, sd = 1)    

# generate CDF probabilities for value(s) in vector q 
cdf <- pnorm(q, mean = 0, sd = 1)    

# generate quantile for probabilities in vector p
quantile <- qnorm(p, mean = 0, sd = 1)    

# generate density function probabilites for value(s) in vector x
density <- dnorm(x, mean = 0, sd = 1) 


# Uniform Distributions ---------------------------------------------------



# create a uniform distribution of random numbers
# betwee4n 10 and 130.  
unifdist <- runif(100, 10, 130)
# runif(n, min = 10, max = 25) 
rif <- runif(100, 10, 95)


# use sample to take a random sample
# sample(0:1000, n=100, replace=TRUE) 

s1 <- sample(0:1025, 100, replace = TRUE)
s2 <- sample(0:1000, 100, replace = FALSE)


# Create z scores with scale()   ------------------------------------------

# Scale returns a matrix  ( has two dimensions)
zscores <- scale(s1) 

hist(zscores, col = "yellow") 

## Coerce the matrix into a vector with as.numeric  

zvector <- as.numeric(scale(s1))

class(zvector)
df <- data.frame(scores = s1, 
                 zscores = zvector)

df
# Create the probabilities from Z score using pnorm()-----------------------------------

probs <- pnorm(zvector, 0, 1)
probs

df$probs <- probs
df

mean(zscores)

hist(df$probs, col = "yellow") 


# Calculate Probability in non-standard Distributions   -------------------
mean(s1)
sd(s1)

nonstandardprob <- pnorm(s1, mean = 531.7, sd = 298.5669)
hist(nonstandardprob, col="yellow")
