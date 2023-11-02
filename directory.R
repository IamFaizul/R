library(readxl)
my_data <- read_excel("pd1.xlsx", col_types = c("text", 
                                                "numeric", "numeric"))
View(my_data)
str(my_data)
head(my_data)
tail(my_data)
plot(my_data)
boxplot(my_data$HEIGHT,my_data$HEIGHT)

boxplot(my_data$WEIGHT ~  my_data$CROP)