## Creator    : Natasudharma Widjaja (Nathan)
## Student ID : 1521252
## Class      : Introduction to Data Science

## R Function to calculate the reports the number of completely 
## observed cases in each data file as per specified by id 

complete <- function(directory, id=1:332) {
  
  
  ## load required function from other file
  source('getCsvFile.R')
  
  
  ## check if id is in range of 1 to 332
  if (max(id) > 332 | min(id) < 1) { 
    stop('ERROR : ID must be in range of 1 - 332 only ')
  }

  
  ## assign starting values, and save id range to variable range
  ## as we need to create another vector with the name of id
  index <- 1
  range <- id
  
  
  ## create initial empty vector to prevent the closure problem 
  ## which is caused if the vector are created reactively
  id <- c()
  nobs <- c()
  
  
  ## load data from corresponding CSV files
  ## and report the number of completely observed cases 
  for(i in range) {
    
    ## read data
    thisData <- read.table(getCsvFile(directory, i), header=TRUE, sep=',')
    
    ## assign vector elements
    id[index] <- i
    nobs[index] <- sum(complete.cases(thisData))
    
    ## don't forget to increase the index
    index <- index + 1
    
  }

  
  ## return final result
  return(data.frame(id, nobs))
  
  
}
