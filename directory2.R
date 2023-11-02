library(readxl)
my_data <- read_excel("pd1.xlsx", col_types = c("text", 
                                                "numeric", "numeric"))
View(my_data)

#strip chart
stripchart(my_data$HEIGHT)
stripchart(my_data$WEIGHT)
stripchart(my_data$CROP)
stripchart(my_data$HEIGHT~my_data$WEIGHT)

#Histogram
hist(my_data$HEIGHT)
hist(my_data$WEIGHT)

#Scatter Plot
plot(my_data$HEIGHT,my_data$WEIGHT)

#qqnorm plot
qqnorm(my_data$HEIGHT)
qqnorm(my_data$WEIGHT)

#barplot
barplot(my_data$HEIGHT)
barplot(my_data$WEIGHT)

#Mosaic plot
mosaicplot(~my_data$CROP+my_data$HEIGHT)
