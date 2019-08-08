## Creator    : Natasudharma Widjaja (Nathan)
## Student ID : 1521252
## Class      : Introduction to Data Science

## R Function to  calculates 
## the correlation between sulfate and nitrate for monitor locations  

corr <- function(directory, threshold = 0) {
  
  ## load the complete.R function first
  source('complete.R')
  data <- complete('specdata', 1:332)
  
  ## return a filtered data which are above threshold
  thresholdData <- which(data$nobs > threshold)
  combinedData <- data.frame()
  
  ## loop and load into variable
  for (i in thresholdData) {
    ## cat('meet threshold : ', i, '\n')
    newData <- read.table(getCsvFile(directory, i), header=TRUE, sep=',')
    combinedData <- rbind(combinedData, newData)
  }
  
  ## clean the data
  cleanedData <- combinedData[complete.cases(combinedData), ]
  
  ## final result decision
  if (length(cleanedData) > 0) {
    result <- cor(cleanedData$sulfate, cleanedData$nitrate)
  }
  else {
    result <- 0
  }
  
  
  ## return final result
  return(result)

  
}
