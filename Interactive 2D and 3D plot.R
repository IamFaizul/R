library(ggplot2)
iris
p <- ggplot(iris,aes(iris$Sepal.Width,iris$Sepal.Length,col=iris$Species))+
  geom_point()
p

library(plotly)
plot_ly(z=volcano) %>% add_surface() #way-1
plot_ly(z=volcano, type="surface") #way-2
#both way-1 and way-2 do the same thing.we can use any one.

#Different surfaces
x <- c(1,2,3,4,5)
y <- c(1,2,3,4,5)
z <- rbind(
  c(0,1,0,1,0),
  c(1,0,1,0,1),
  c(0,1,0,1,0),
  c(1,0,1,0,1),
  c(0,1,0,1,0)
)

p1 <- plot_ly(
  type='surface',
  contour=list(
    x=list(show=TRUE ,start=1.5,end=2,size=0.04,color="red"),
    z=list(show=TRUE,start=0.5,end=0.8,size=0.05)),
  x= ~x,
  y= ~y,
  z= ~z)
p1

p1 <- plot_ly(data=iris,x=~Sepal.Length,y=~Petal.Length)
p1
p1 <- plot_ly(data=iris,x=~Sepal.Length,y=~iris$Sepal.Width,
              marker= list(size=10,
                           color="red",
                           line=list(color="black",
                                     width=2)))
p1

#line+scatter
x_1 <- rnorm(100,mean=5)
x_0 <- rnorm(100,mean=0)
x_2 <- rnorm(100,mean=-5)
x <- c(1:100)
d1 <- data.frame(x,x_0,x_1,x_2)
fig <- plot_ly(d1,x=~x)

fig<- fig %>% add_trace(y=~x_1,name="x 0",mode="lines")
fig <- fig %>% add_trace(y=~x_0,name="x 1",mode="lines+markers")
fig <- fig %>% add_trace(y=~x_2,name="x 2",mode="lines")
fig


fig1 <- plot_ly(data = iris,x= ~Sepal.Length,y= ~Petal.Length,color=~Species)
fig1

#Pie chart
labels= c("Oxygen","Hydrogen","Carbon_Dioxide","Nitrogen")
values= c(4500,2500,1053,500)
fig2 <- plot_ly(type="pie",labels=labels,values=values,
                textinfo="label+percent",
                insidetextorientation="radial")
fig2

#Bar plot
x <- c("Orange","Mango","Apple")
y <- c(23,18,31)
plot_ly(type="bar",x=x,y=y,color=x)
plot_ly(data=iris,type="bar",x=iris$Sepal.Length,y=~iris$Petal.Length,color = ~iris$Species)
