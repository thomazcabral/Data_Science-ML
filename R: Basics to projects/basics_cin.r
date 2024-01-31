var <- "Hello world!"

num <- 10

num2 <- 20L

y = readline("Digite um número: ")

y <- as.integer(y)
print(y)

teste <- as.integer(readline("Digite algo: "))

if (1 == 2) {
  print("sim")
} else {
  print("não")
}

array <- c(1, 2, 3)
array <- 1:3
array <- seq(1, 5, 2) # sequence of numbers starting at 1, until 5, stepping 2 by 2
array <- rep(2, 5) # repetition of the number 2 5 times

contador <- 5
while(contador != 0) {
  print(contador)
  contador = contador - 1 # contador -= 1 does not work
}

for (x in c(1, 2, 3)) {
  print(x)
}


a <- c(1)

for (x in 2:4) {
  a <- c(a, x)
}


i <- 1
array <- c()
for (num in 1:5) {
  while(i <= num) {
    array <- c(array, num)
    i = i + 1
  }
  i = 1
}
print(array)


func <- function(x) {
  return(x * x)
}
print(func(10))

factorial <- function(num) {
  if(num == 1) {
    return(1)
  } else {
    return(factorial(num-1) * num)
  }
}
print(factorial(5))
