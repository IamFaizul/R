library(readxl)
my_data <- read_excel("pd1.xlsx", col_types = c("text", 
                                                "numeric", "numeric"))
View(my_data)
#basic boxplot
boxplot(my_data$HEIGHT ~my_data$CROP)

#labeling
boxplot(HEIGHT~CROP,data=my_data,main="Growth of Crop",xlab="CROPS",ylab="HEIGHTS OF CROPS(cm)")

#coloring
boxplot(HEIGHT~CROP,data=my_data,main="Growth of Crop",xlab="CROPS",ylab="HEIGHTS OF CROPS(cm)",col="#42f5d1",border="#f57e42")

#grouping of treatment
library(readxl)
my_data3 <- read_excel("pd3.xlsx", col_types = c("text", 
                                                 "numeric", "numeric", "text"))
View(my_data3)
boxplot(my_data3$HEIGHT~my_data3$NAME*my_data3$FIT)

max(my_data3$HEIGHT)
min(my_data3$WEIGHT)
var(my_data3$HEIGHT)
sd(my_data3$WEIGHT)
summary(my_data3)

#ANOVA
a<-aov(my_data3$HEIGHT~my_data3$WEIGHT)
summary(a)
