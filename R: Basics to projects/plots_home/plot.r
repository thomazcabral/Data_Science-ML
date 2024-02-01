# plot is used to draw points in a graph
# axis = 1 -> rows
# axis = 2 -> columns

plot(1, 3) # one point in the diagram
plot(c(1, 8), c(3, 10)) # two points
plot(c(1, 2, 3, 4, 5), c(6, 7, 8, 9, 12)) # five points

plot(1:10) # x = y from 1 to 10

plot(1:10, type="l") # l is for line

plot(1:10, main="The IP dilema", xlab="Messages in the server", ylab="minutes without tutoring", type="l")
# main is the title of the diagram, xlab and ylab are the label for the x and y-axis, respectively


plot(1:10, col="red", main="The IP dilema", xlab="Messages in the server", ylab="minutes without tutoring", type="l")
# col is for the color

plot(1:10, cex=2, col="red", main="The IP dilema", xlab="Messages in the server", ylab="minutes without tutoring") # type="l" removed
# cex=1 is default and the greater the number the bigger the point gets and vice-versa

plot(1:10, pch=20, cex=2, col="red", main="The IP dilema", xlab="Messages in the server", ylab="minutes without tutoring") # type="l" removed
# with pch, we can choose between different types of shapes
