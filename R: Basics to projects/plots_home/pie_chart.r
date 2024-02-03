# pie charts

test <- c(1, 2, 3, 4)
pie(test) # counterclockwise

angle <- c(1, 2, 3, 4)
pie(angle, init.angle=90) # start making the chart in the angle 90

ip <- c(0.5, 2.5, 3, 4)
labels <- c("Redu", "Discord", "Dikastis", "VS Code") # label to signal the segments meaning
pie(ip, label=labels, main="Most used applications in the Programmation class")

colors <- c("purple", "blue", "yellow", "black") # color the chart
pie(ip, label=labels, main="Most used applications in the Programmation class", col=colors)

pie(ip, main="Most used applications in the Programmation class", col=colors)
legend("bottomright", labels, fill=colors) # creating a legend in the bottom right corner
