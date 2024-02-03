# bars

names <- c("Digital sys.", "Algorithms", "Statistics", "Data Science") # x-axis
grades <- c(1, 6, 8, 10) # y-axis

barplot(grades, names.arg=names) 
barplot(grades, names.arg=names, col="red") # coloring red
barplot(grades, names.arg=names, density=10) # special texture
barplot(grades, names.arg=names, width=c(1, 2, 3, 4)) # width of each bar
barplot(grades, names.arg=names, horiz=TRUE) # same chart but horizontally
