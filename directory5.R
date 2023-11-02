install.packages("ggplot2")
library(ggplot2)

#basic syntax
#1-- ggplot(that's the function)
#2-- data (import data)
#3-- mapping(define x axis and y axis)
#4--geometry(scatter,box,line etc.)

library(readxl)
x <- read_excel("ggdata.xlsx", sheet = "gg1")
View(x)

ggplot(data = x,mapping = aes(x=fert.type,y=height))+geom_point()
#more specific
ggplot(x,aes(crop,height))+geom_point(size=3,colour="red")+geom_line(colour="green")+geom_boxplot(col="purple")

ggplot(x,aes(crop,height,fill=water))+
  geom_boxplot()+
  facet_wrap(~fert.type)+
  labs(x="Name of crop",y="Height of Crop",title="Plant growth")+
theme_bw()
ggsave("ggplot1.tiff",units="in",width = 8,height=6,dpi=300,compression="lzw")
