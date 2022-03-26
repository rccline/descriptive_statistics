square_val <- function(x){
  x^2
} 

square_val(2)

# unintended input 

# unintended input --------------------------------------------------------


square_val(cat)

square_val2 <- function(x){
  stopifnot("Input must be numeric"= is.numeric(x))  # must be true
  x^2
}  

square_val2(cat)
square_val2(16)  


# more complex example - generate random data that is reproducible --------


generate_df <- function(n=10, with_seed = NULL) {
  if(!is.null(with_seed)){set.seed(with_seed)}
  # pad the values with repeated zeros
  
  pad_length <- paste0("%0", nchar(n), "d")
  random_int <- sample(1:n, replace = TRUE)
  padded_int <- sprintf(pad_length, random_int) 
  
  # create a df with combined random letters and integers
  
  tibble::tibble(
    id=paste0(
      sample(LETTERS, size=n, replace=TRUE), padded_int
  ),
  values= rnorm(n=n, mean = 15, sd=2)
  )
}  

generate_df(125)


# Reproducibly random -------------------------------------------------------------


all.equal(
  generate_df(10, with_seed = 123),
  generate_df(10, with_seed = 123)
)
  
  

# Or fully random ---------------------------------------------------------

all.equal(
  generate_df(10),
  generate_df(10 )
)


# passing the dots  -------------------------------------------------------


# To pass as many arguments as you want
# Any argument that rnorm will accept, it wil take. 

generate_df <- function(n=10, with_seed = NULL, ...) {
  if(!is.null(with_seed)){set.seed(with_seed)}
  # pad the values with repeated zeros
  
  pad_length <- paste0("%0", nchar(n), "d") # nchar()= count the number of characters
  random_int <- sample(1:n, replace = TRUE)
  padded_int <- sprintf(pad_length, random_int) 
  
  # create a df with combined random letters and integers
  
  tibble::tibble(
    id=paste0(
      sample(LETTERS, size=n, replace=TRUE), padded_int
    ),
    values= rnorm(n=n, mean = 15, sd=2)
  )
}  



# passing Tom Mock's gtExtras  -------------------------------------------------------


# To pass as many arguments as you want
# Any argument that rnorm will accept, it wil take. 

generate_df <- function(n=10L, n_grps = 1L, mean=c(10), sd= mean/10, 
                        with_seed = NULL, ...) {
  if(!is.null(with_seed)){base::set.seed(with_seed)}
  # pad the values with repeated zeros
  
  pad_length <- base::paste0("%0", nchar(n), "d") # nchar()= count the number of characters
  random_int <- base::sample(1:n, replace = TRUE)
  padded_int <- base::sprintf(pad_length, random_int) 
  
  # create a df with combined random letters and integers
  
  dplyr::tibble(
    row_id = 1:(n*n_grps),
    id=paste0(
      sample(LETTERS, n*n_grps, replace=TRUE), padded_int),
      grp = sprintf("grp-%s", 1:n_grps) %>% rep(each=n),
    values= mapply(rnorm, n, mean, sd) %>%  as.vector()
  )
}  

generate_df()


