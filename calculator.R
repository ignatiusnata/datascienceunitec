## Creator    : Natasudharma Widjaja (Nathan)
## Student ID : 1521252
## Class      : Introduction to Data Science

## R Function to calculate the mean of specific pollutant 
## from a set of files as specified in the argument id 


totalFactors <- function(number) {
  
  ## this function will check how many factors are 
  ## there for a specified number
  
  total <- 0
  for(i in 1:number) {
    if (number %% i == 0) {
      total <- total + 1
    } 
  }
  
  return(total)
  
}

calculator <- function() {
  
  
  ## display opening text
  text <- c()
  text[1] <- '******Simple R Calculator - Select operation: ******\n'
  text[2] <- '1. Add      \n'
  text[3] <- '2. Subtract \n'
  text[4] <- '3. Multiply \n'
  text[5] <- '4. Divide   \n'
  text[6] <- '5. Factors  \n'
  text[7] <- '6. Prime    \n'
  cat(text)
  
  
  ## get user input based on menu 1 - 6
  choice <- readline(prompt="Enter choice [1/2/3/4/5/6]: ")
  
  
  ## if user requires 2 numbers
  if (choice >= 1 & choice <= 4) {
    
    num1 <- as.numeric(readline(prompt="Enter first number: "))
    num2 <- as.numeric(readline(prompt="Enter second number: "))
    
    ## addition
    if (choice == 1) {
      cat('RESULT: ', num1, '+', num2, '=', num1 + num2)
    }
    
    ## substraction
    if (choice == 2) {
      cat('RESULT: ', num1, '-', num2, '=', num1 - num2)
    }
    
    ## multiplication
    if (choice == 3) {
      cat('RESULT: ', num1, '*', num2, '=', num1 * num2)
    }
    
    ## division
    if (choice == 4) {
      cat('RESULT: ', num1, '/', num2, '=', num1 / num2)
    }
    
  }
  
  
  ## factoring
  if (choice == 5) {
    
    num <- as.numeric(readline(prompt="Enter the number: "))
    cat('The factors of ', num, 'are: \n\n')
    
    for(i in 1:num) {
      if (num %% i == 0) {
        cat(i, '\n')
      } 
    }
  }
  
  
  ## prime numbers
  if (choice == 6) {
    
    ## get input
    num <- as.numeric(readline(prompt="Enter how many prime numbers you need : "))
    
    ## starting point
    prime <- 2
    totalPrime <- 0
    
    ## result here
    cat('The', num, 'prime numbers are : \n')
    
    ## generate and print the output
    while (totalPrime < num) {
      
      ## prime numbers will have more than 2 factors
      ## which are 1, the number itself and other numbers
      ## this codes will print the number if it is a prime
      
      if (totalFactors(prime) < 3) {
        cat(prime, '\n')
        totalPrime <- totalPrime + 1
      }
      
      ## keep increment the number
      prime <- prime + 1
      
    }
  }

  
}
