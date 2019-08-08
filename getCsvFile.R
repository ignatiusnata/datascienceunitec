## Creator    : Natasudharma Widjaja (Nathan)
## Student ID : 1521252
## Class      : Introduction to Data Science

## R Function to format the correct file based on a number input

getCsvFile <- function(directory = 'specdata', fileNumber) {
  
  ## this function will generate the complete file name
  ## for the next function to use or load
  
  finalFile <- fileNumber
  
  if (fileNumber < 10 ) {
    finalFile <- paste('00', fileNumber, sep='')
  } 
  
  if (fileNumber >= 10 && fileNumber < 100) { 
    finalFile <- paste('0', fileNumber, sep='')
  }
  
  finalFile <- paste(directory, '/', finalFile, '.csv', sep='')
  return(finalFile)
  
}