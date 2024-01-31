# VARIABLES

name <- "Emmanuel" # = can also be used in this case, but it can be forbidden in some other cases
age <- 40 # so the <- operator is preferred
40 -> age # same thing
age <<- 40 # global variable

name # the print function is not needed in this case
age

text <- "perfect"
paste("R is", text) # the space after "is" is placed automatically

text1 <- "R is"
text2 <- "perfect"
paste(text1, text2) # gives the same result as before

# it is not possible to combine a string and a number in R

var1 <- var2 <- var3 <- "Orange" # assign 3 variables with the same value

var1
var2
var3

# the variable names must start with a letter or . and can also contain _
# if it starts with . it cannot be followed by a digit
# case-sensitive


# DATA TYPES

var <- 30
var <- "Sally"
# variables do not have to be declared with its data type and they can be changed along the code

x <- 87.08
class(x) # numeric

x <- 87L # L to declare that 87 is int
class(x) # integer

x <- 87i + 8 # i is an imaginary number
class(x) # complex

x <- "R is awesome!" # single or double quotes make no difference
class(x) # character, with the same meaning as string

x <- TRUE # TRUE and FALSE need to be uppercase
class(x) # logical (boolean)

num1 <- 1L # integer
num2 <- 2 # numeric

num3 <- as.numeric(num1) # convert to numeric
class(num3)

num4 <- as.integer(num2) # convert to integer
class(num4)


# MATH FUNCTIONS

max(87, 68, 8)
min(54, 70, 2)

sqrt(16)

abs(-4.7) # absolute value

ceiling(8.7) # rounds to the nearest integer greater or equal than 8.7
floor(8.7) # rounds to the nearest integer less or equal than 8.7


# STRINGS

str <- "Lorem ipsum dolor sit amet, 
consectetur adipiscing elit, 
sed do eiusmod tempor incididunt 
ut labore et dolore magna aliqua."

str # \n is added at the end of each line to represent the line break
cat(str) # it prints just like the text is displayed in the code

nchar(str) # length of the string

str <- "Hello!"

grepl("H", str) # checks if a char or str is present in a string
grepl("X", str)

# \\ backslash
# \n new line
# \r carriage return
# \t tab
# \b backspace


# OPERATORS

# arithmetic operators
1 + 2
1 - 2
1 * 2
1 / 2
2 ^ 4 # exponent
5 %% 3 # remainder
5 %/% 3 # integer division

# comparison operator are the same as in python

# boolean operators

TRUE & FALSE # && can also be used in some cases
TRUE | FALSE # . || can also be used in some cases (desconsider the .)
! TRUE

# conditionals

num1 <- as.integer(readline("Type a number: ")) # readline is equivalent to the input function
num2 <- as.integer(readline("Type other number: "))

if (num1 > num2) {
  print("num1 is greater than num2")
} else if (num1 < num2) {
  print("num2 is greater than num1")
} else {
  print("num1 is equal to num2")
}


# WHILE LOOPS

i <- 0
while (i < 5) {
  print(i)
  i <- i + 1 # i += 1 and i++ do not work here
}

i <- 0
while (i < 5) {
  print(i)
  i <- i + 1
  if (i == 4) {
    break
  }
}

i <- 0
while (i < 5) {
  i <- i + 1
  if (i == 2) {
    next # skip this specific iteration
  }
  print(i)
}


# FOR LOOPS

cards <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
for (card in cards) {
  print(card)
}

# break and next can be used the same way as before


# FUNCTIONS

hello_function <- function(name) {
  paste("Hello,", name)
}
hello_function("Thomaz")

add <- function(a, b) {
  return(a + b)
}
add(1, 2)

some_function <- function(place="Recife") {
  paste("I love", place)
}
some_function("Brazil")
some_function()

# recursion, nested functions and the use of global variables are the same as in python
