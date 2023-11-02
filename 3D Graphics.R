install.packages("plot3D")
library(plot3D)
data("iris")
head(iris)
x <- sep.l <- iris$Sepal.Length
y <- pet.l <- iris$Petal.Length
z <- sep.w <- iris$Sepal.Width

#Labels
scatter3D(x,y,z ,clab = c("Sepal","width(cm)"))

#size and shape of points
scatter3D(x,y,z,colvar =NULL ,col = "Red",
          pch=20,cex=5)
#pch means shape of points
#cex means size of points
help("scatter3D") #I have to search everything by using help(Most effective)

#Full box
scatter3D(x,y,z,bty = "g",colkey = plot,main="bty='g'",
          phi=45)
#bty means type of box (use help("scatter3D") for more info)
#bty arguments are“b”, “b2”, “f”, “g”, “bl”, “bl2”, “u”“n”
#phi means viewing angle
#colkey means color key 'colkey' should be a list, a logicalor NULL

#change the shape of points
scatter3D(x,y,z,bty = "g",colkey = TRUE ,main="bty='g'",
          phi=45,pch=18)
#Colors
scatter3D(x,y,z,pch=19,bty="u",colkey = FALSE,
          col.panel="Yellow",expand=0.7,
          col.grid="black")

#when we are using scatter 3D function ,after putting x,y,z
#other things can be arranged randomly,there is no serial issue
#col.panel is color of wall
#col.grid is color of lines on the wall
#We can also use hexcode in col.panel and col.grid

#Number of colors
scatter3D(x,y,z,bty="g",pch=17,col=gg.col(6))
#number of colors depends on gg.col(number)

#customize color

scatter3D(x,y,z,bty="g",pch=19,
          col=ramp.col(c("Red","Blue","Green","Yellow")))
#The colors can be anything(also hexcode)

#Color variable
scatter3D(x,y,z,bty="g",pch=18,
          col.var=as.integer(iris$Species),
          col=c("#42eff5","#b0f542","#9042f5"),
          ticktype="detailed",
          colkey = list(at=c(2,3,4),side=1,
                        addlines=TRUE,length=0.7,width=0.8,
          labels=c("setosa","versicolor","virginica")))


#Angle- theta,phi
scatter3D(x,y,z,theta =0,phi =20)

#Labels change
scatter3D(x,y,z,pch=18,theta=45,phi = 45,
          main="Iris data",xlab="Sepal.length",
          ylab="Petal.length",zlab="Sepal.width")

scatter3D(x,y,z,phi=20,bty="g",
          pch=18,cex=2,ticktype="detailed")
#ticktype. character: "simple" draws just an arrow 
#parallel to the axis to indicate direction of increase

#Text graph
text3D(x,y,z,labels=rownames(iris),
          add=TRUE,colkey = FALSE,cex=0.5)

#Line plot
scatter3D(x,y,z,bty="g",type="l",
          ticktype="detailed",lwd=5)
#For scatter2D and scatter3D the plottypes that are supported are:
#type = "p", type = "l", type = "h", type = "o". For type = "b", type = "o" is used instead.


#Line+Point
scatter3D(x,y,z,phi = 0,bty="g",type="h",
          ticktype="detailed",pch=20,
          cex=c(0.5,1,1.5))

#Confidence Interval(CI) calculation
CI <- list(z=matrix(nrow=length(x),
                    data=rep(0.1,2*length(x))))
scatter3D(x,y,z,phi=0,bty="g",col=gg.col(100),
          pch=18,CI=CI)

#Bar 3D Hist 3D
data("VADeaths")
#hist 3D andribbon 3D with greyish background
hist3D(z=VADeaths,scale=FALSE,expand=0.01,bty="g",
       phi=20,col="#42f5f2",border="black",shade = 0.2,
       ltheta = 90,space = 0.3,ticktype="detailed",d=2)


install.packages("plotly")
library(plotly)
p <- plot_ly(z=volcano,type="surface")
p
data("volcano")
