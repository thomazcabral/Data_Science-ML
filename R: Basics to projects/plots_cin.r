x <- 1:10
y <- 1:10

plot(x, y, xlab = "tempo", ylab = "distancia")

array <- c(1, 1, 1, 2, 3, 1, 3, 3, 3, 2, 1, 2, 1, 3)
comidas <- table(array)
names(comidas) <- c("pizza", "bolo", "salgado")
pie(comidas, main="comidas")

barplot(comidas, col="purple", main="comidas")
hist(array)
