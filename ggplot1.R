#Plotting data in RStudio
data()
x <- iris
View(x)
summary(x)
plot(x)
boxplot(x$Species ~ x$Sepal.Length)
boxplot(x$Sepal.Length ~ x$Species)
boxplot(x$Petal.Length ~ x$Sepal.Width)
barplot(x$Petal.Length)
#Assignment 1: How to divide by groups in barplot?

hist(x$Sepal.Length)
hist(x$Petal.Length)
plot(x$Sepal.Length ~x$Sepal.Width)
library(RColorBrewer)
help("RColorBrewer")
#Package for color
install.packages("RColorBrewer")
library(RColorBrewer)
#brewer.pal(n, name) where n is Number of different colors in the palette, minimum 3, maximum depending on palette
hist(x$Sepal.Length,col=brewer.pal(8,"green") ,main="coloring tools")
plot(x$Sepal.Length,col=brewer.pal(8,"yellow"),main="Plot coloring")

#plotting with ggplot2

install.packages("ggplot2")
library(ggplot2)
help("ggplot")

ggplot(x,aes(x$Species,x$Sepal.Length,fill=x$Species))+
  geom_boxplot()+ labs(title = "Iris data set",x="Species",y="Sepal length",fill="Species")
help("geom_bar")  
#bar plot in ggplot

ggplot(x,aes(x$Species,x$Sepal.Length,fill=x$Species))+
  geom_bar(position = "dodge",stat = "identity")+
  #facet_wrap(~x$Species)+
  labs(title = "Iris data set",x="Species",y="Sepal length"
       ,fill="Species")
#What does stat identity do in R?
#Ans: If it is stat = "identity" , we are asking R to use the y-value we provide for the dependent variable.
#What is position in Geom_bar?
#Ans: For bar charts, position takes the following values: "stack" , "identity" , "fill" or "dodge" . The default value for position in geom_bar() is "stack" .
#What is facet_wrap?
#Ans:facet_wrap() wraps a 1d sequence of panels into 2d


data()
View(CO2)
str(CO2)
head(CO2)
nrow(CO2)
ncol(CO2)
#How to export excel files?
install.packages("writexl")
library(writexl)
help("writexl")

library(ggplot2)
ggplot(trees,aes(trees$Girth,trees$Height))+
  geom_point()+
  geom_smooth(method = "lm")

ggplot(trees,aes(trees$Girth, trees$Volume))+
  geom_point()+
  geom_line()+
  geom_smooth(method = "lm")

plot1 <- ggplot(trees,aes(trees$Height, trees$Volume))+
  geom_point(size=5)+
  geom_line()+
  geom_smooth(method = "lm")+
  labs(title = "Trees dataset",x="Height of trees",y="Volume")

plot1+ggsave("plot1.tiff")
plot1+ggsave("plot1.tiff",units="in",width=8,height = 6,dpi=300,compression="lzw")
#the main purpose of using compression,height,width
#is because without these picture will be of big size
#but if we use these picture quality will remain same
#but the size of pic will be much smaller

plot1+coord_flip() #This function flips coordinates

c <- cars
View(c)
ggplot(c,aes(c$speed,c$dist))+geom_point()+
  geom_smooth(method = "lm",se=T,level=0.90)
#Here 'se' is standard error and level means confidence interval

#Scatter plot in multiple line
ggplot(Orange,aes(Orange$age,Orange$circumference,col=Orange$Tree))+
  geom_point(size=3,alpha=0.7,shape=Orange$Tree)+
  labs(title="Orange dataset",x="Age",y="Circumference",col="Color of Trees")
  
#geom line
  
ggplot(Orange,aes(Orange$age,Orange$circumference,col=Orange$Tree))+
  #geom_point(size=3)+
  geom_line(aes(linetype=Orange$Tree),size=1)+
  labs(title="Orange dataset",x="Age",y="Circumference",col="Color of Trees")
#geom boxplot

ggplot(Orange,aes(Orange$age,Orange$circumference,fill=Orange$Tree))+
  geom_boxplot()
  
#Bubbleplot
install.packages("viridis")
library(viridis) 
q <- quakes
q_sample <- quakes[seq(from=1,to=1000,by=10),]
ggplot(q_sample,aes(lat,long))+
  geom_point(aes(size=mag,color=mag))+ guides(size=FALSE)+
  scale_colour_viridis_b(option="F")+
  scale_size_continuous(range=c(1,8))+
  labs(x="Latitude",y="Longitude",title="Graph")+
  ggsave("Bubbleplot.pdf")
  
help("viridis")
                    