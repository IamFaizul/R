#Ways of making heatmap
#process 1- using built in function
c <- mtcars
c <- as.matrix(mtcars)
heatmap(c,scale = "column") #In R, you can use the scale() function to scale the values in a vector, matrix, or data frame.
#You will almost always receive meaningless results if you do not normalize the vectors or columns you are utilizing. 
#Scale() is a built-in R function that centers and/or scales the columns of a numeric matrix by default


#process 2- using gplots package(not ggplot)
install.packages("gplots")
library(gplots)
heatmap.2(c,scale = "column",col=bluered(100))
#if we want to remove tracing
library(gplots)
heatmap.2(c,scale = "column",col=bluered(100),trace = "none")

#process 3- using pheatmaps

install.packages("pheatmap")
library(pheatmap)
pheatmap(c,scale = "column")
#If we want to cut rows and maps

library(pheatmap)
pheatmap(c,scale = "column",cutree_rows = 4,cutree_cols = 2)

#process 4- using ggplot package
library(ggplot2)
m <- mtcars
library(reshape)
m1 <- melt(mtcars)
ggplot(m1,aes(value,variable,fill=value))+
  geom_tile()+
  scale_fill_gradient(low = "blue",high="red")
