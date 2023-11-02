library(readxl)
my_data4 <- read_excel("pd4.xlsx", sheet = "data2", 
                       col_types = c("text", "numeric", "numeric", 
                                     "text"))
View(my_data4)
boxplot(my_data4$Height~my_data4$Crop)

#multiple comparison of means
#1-Tukey.HSD test
install.packages("agricolae")
library(agricolae)
help("agricolae-package")
model<-aov(Height~Crop,data = my_data4)
out<-HSD.test(model,"Crop",group = TRUE,console = TRUE,main="Tukey Test")

