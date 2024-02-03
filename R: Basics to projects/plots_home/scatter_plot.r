# scatter plot

x <- c(2, 4, 6, 8, 5, 5, 6, 7, 8, 9, 2, 1) # x-axis
y <- c(80, 90, 95, 99, 105, 109, 87, 93, 99, 100, 88, 93) # y-axis

plot(x, y)

plot(x, y, main="Tiredness per class hours", xlab="Hours of class", ylab="Tiredness level")

x1 <- c(1, 2, 4, 5, 6, 8, 9, 10, 7, 5)
y1 <- c(80, 77, 99, 88, 88, 105, 101, 110, 92, 99)

x2 <- c(2, 3, 4, 1, 5, 9, 7, 8, 8, 10)
y2 <- c(77, 88, 99, 110, 111, 78, 99, 104, 103, 87)

plot(x1, y1, col="red", cex=2) # create a simple plot
points(x2, y2, col="blue", cex=2) # adding points in that plot
# cex used to make the points bigger
