install.packages("psych")
install.packages("corrplot")
install.packages("RColorBrewer")
library(psych)
library(corrplot)
library(RColorBrewer)

#psych package
data("iris")
x <- corr.test(iris[-5])
print(x)
pairs.panels(iris[,-5])

#Corrplot package

m <- cor(iris[,-5],method = "kendall")#If I don't put any command then it will automatically take Pearson Correlation Method
corrplot(m)
corrplot(m,type = "full",order = "hclust",method = "pie",
         color=brewer.pal(n=8,name = "RdBu"))

#Mixed corrplot
corrplot.mixed(m,lower.col = "black",number.cex=0.7)
corrplot.mixed(m,lower="ellipse",upper = "pie",tl.col="blue")
