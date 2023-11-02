data("Orange") #to view all data sets in R
View(CO2) #to view a particular data set
View(iris)
View(PlantGrowth)
View(mtcars)
View(trees)
View(npk)
head(CO2) #to show 1st 6 rows of data
names(CO2) #to show row names of data
nrow(CO2) #to show number of rows of data
ncol(CO2) #to show number of columns of data
install.packages("writexl") #to save .xlsx files
library(writexl)
write_xlsx(CO2,path="C:\\Users\\USR\\Documents\\R\\test 1\\CO2.xlsx") #commandline of saving .xlsx files

library(ggplot2) #to plot scatter plot and figures
ggplot(trees,aes(Girth,Height))+geom_point()+geom_smooth(method = 'lm')

library(ggplot2)
data("cars")
ggplot(data=cars,aes(speed,dist))+geom_point()+
  geom_smooth(method="lm",se=T,level=0.99)
#scatterplot with multiline
data("Orange")
ggplot(Orange,aes(age,circumference,color=Tree))+geom_point(size=3,shape=19)+geom_line()

#separate by shape
data("Orange")
ggplot(Orange,aes(age,circumference,color=Tree))+geom_point(size=5,shape=19)+geom_line(linetype=1,size=2)

data("Orange")
ggplot(Orange,aes(age,circumference,color=Tree))+
  geom_point(size=5,shape=19)+
  geom_line(aes(linetype=Tree),size=2)+
  labs(x="Age",y="Circumference",title="Orange dataset")+
  ggsave("scatterplot.pdf")
  
#bubble plot
install.packages("viridis")
library(viridis)
data("quakes")
nrow(quakes)
q_sample<-quakes[seq(from=1,to=1000,by=10),]  
nrow(q_sample)
ncol(q_sample)

library(ggplot2)
ggplot(q_sample,aes(lat,long))+geom_point(aes(size=mag,color=mag))+
  guides(size=F)+ #it removes size from geom_point aes
  guides(color=F)+ #it removes color from geom_point aes
  scale_color_viridis_b(option = "F")+
  scale_size_continuous(range=c(1,7))+
  labs(x="Latitude",y="Longitude",title="Bubble Plot")+
  ggsave("Bubble plot.pdf")

#Jitter Plot
data("diamonds")
d_sample<- diamonds[seq(from=1,to=49000,by=1000),]
nrow(d_sample)
ggplot(d_sample,aes(cut,price))+geom_point()
ggplot(d_sample,aes(cut,price))+geom_jitter(aes(size=1,color=cut))
#This diamond data set has row of 53000+ ,so it's a very big data set .
#If we use geom_point here the plot won't be well visualised.So for overcoming
#this we use geom_jitter ,which gives very well structured scattered plot that is 
#very useful for visualisation