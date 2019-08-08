## Creator    : Natasudharma Widjaja (Nathan)
## Student ID : 1521252
## Class      : Introduction to Data Science

## R Function to return all pollutant values that are greater than p 
## accross monitors specified by id, from set of files in directory

pollutantvector <- function(directory, pollutant, id, p) {
  
  
  ## load required function from other file
  source('getCsvFile.R')
  
  
  ## check if id is in range of 1 to 332
  if (max(id) > 332 | min(id) < 1) { 
    stop('ERROR : ID must be in range of 1 - 332 only ')
  }
  
  ## load a subset of data based on pollutant
  ## if pollutant is not sulfate or nitrate, produce error
  if (pollutant != 'sulfate' & pollutant != 'nitrate') { 
    stop('ERROR : Please make sure that pollutant is sulfate or nitrate only')
  }
  
  ## initiate data frame
  combinedData <- data.frame()
  
  ## loop and load into variable
  for (i in id) {
    ## cat('FILE : ', i, '\n')
    newData <- read.table(getCsvFile(directory, i), header=TRUE, sep=',')
    combinedData <- rbind(combinedData, newData)
  }
  
  
  ## chosen vector
  if (pollutant == 'sulfate') {
    chosenData <- combinedData$sulfate
  }
  
  if (pollutant == 'nitrate') {
    chosenData <- combinedData$nitrate
  }
  
  ## clean it up
  cleanedData <- chosenData[!is.na(chosenData)]
  
  ## return final result > p
  return(cleanedData[cleanedData > p])

  
}
