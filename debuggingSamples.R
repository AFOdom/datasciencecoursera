printmessage <- function (x) {
        if (is.na(x))
                #gives a message without stopping the function
                #without this, function will abort if NA is
                #passed in
                print("x is a missing value!")
                        
        else if (x>0)
                print ("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x) #doesn't print function's return value
                        # to the console
}

