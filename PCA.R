#read data
data("iris")
#PCA
x<- prcomp(iris[,-5],center = TRUE, scale. = TRUE)
print(x)
summary(x)

#ggplot
iris <- cbind(iris,x$x)
library(ggplot2)
ggplot(iris,aes(PC1,PC2,color=iris$Species,fill=iris$Species))+
  stat_ellipse(geom="polygon",color="black",alpha=0.5)+
  geom_point(shape=21,color="black")

#PCA plot
install.packages("factoextra")
install.packages("FactoMineR")
library(factoextra)
library(FactoMineR)
#PCA table
iris.pca <- PCA(iris[,-5],graph=TRUE,scale.unit=FALSE)

#scree plot
fviz_eig(iris.pca , addlabels = TRUE,ylim=c(0,70))

#PCA plot
fviz_pca_var()













#Example 2 YT:Statistics Time
data("mtcars")
newdata<- mtcars[,c(1:7,10,11)]
head(newdata)

pc<-prcomp(newdata,center = TRUE,scale=TRUE)
print(pc)
summary(pc)
attributes(pc)
print(pc)
pc$sdev[1]^2/sum(pc$sdev^2)*100
var1<-round(pc$sdev[1]^2/sum(pc$sdev^2)*100,2) #round figure of 2 digits
print(pc$sdev[1]) #to print any particular PC standard deviation
#scree plot
plot(pc)
screeplot(x=pc,type ="line",main = "Scree plot")
biplot(pc)
