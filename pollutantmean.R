## Creator    : Natasudharma Widjaja (Nathan)
## Student ID : 1521252
## Class      : Introduction to Data Science

## R Function to calculate the mean of specific pollutant 
## from a set of files as specified in the argument id 

pollutantmean <- function(directory, pollutant, id=1:332) {
  
  
  ## load required function from other file
  source('getCsvFile.R')
  
  
  ## check if id is in range of 1 to 332
  if (max(id) > 332 | min(id) < 1) { 
    stop('ERROR : ID must be in range of 1 - 332 only ')
  }

  
  ## load data from corresponding CSV files
  ## and put them into the combinedData variable
  combinedData <- data.frame()
  
  for(i in id) {
    newData <- read.table(getCsvFile(directory, i), header=TRUE, sep=',')
    combinedData <- rbind(combinedData, newData)
  }
  
  
  ## load a subset of data based on pollutant
  ## if pollutant is not sulfate or nitrate, produce error
  if (pollutant == 'sulfate') { 
    chosenData <- combinedData$sulfate 
  }
  else if (pollutant == 'nitrate') { 
    chosenData <- combinedData$nitrate 
  }
  else {
    stop('ERROR : Please make sure that pollutant is sulfate or nitrate only')
  }
  
  
  ## clean up the data from NA values
  ## and calculate the mean of the requested data
  return(mean(chosenData[!is.na(chosenData)]))
  
  
}
