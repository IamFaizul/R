library(ggplot2)
data("diamonds")
d <- diamonds
head(d)
d_sample <- diamonds[seq(from=1,to=50000,by=100),]
#Violin plot
d1 <- ggplot(d_sample,aes(cut,price,col=cut))+
  geom_point(size=1)+
  geom_violin()+
  geom_boxplot(width=0.1)+
  geom_jitter(size=0.5)
  
d1+facet_wrap(~cut,nrow = 1,scale="free_y")+
  theme_dark() #It's for theme,we can customize this
  #ggsave("Violin plot.pdf")+#normal ggplot saving
  ggsave("Violinplot.tiff",units="in",width=8,height = 6,dpi=300,compression="lzw")#higher resolution for publication


#Heatmaps
#A heat map (or heatmap) is a graphical representation of data where values are depicted by color. Heat maps make it easy to visualize complex
#data and understand it at a glance

library(ggplot2)
data("iris")
i <- iris
install.packages("reshape")
library(reshape)
i1 <- melt(i)
ggplot(i1,aes(Species,variable,fill=value))+
  geom_tile()

?reshape

#How to change color in heatmap?
library(reshape)
i1 <- melt(i)
ggplot(i1,aes(Species,variable,fill=value))+
  geom_tile()+
  scale_fill_gradient(low="Blue",high = "Red")


#Marginal plot
library(ggplot2)
install.packages("ggExtra")
library(ggExtra)
data("mpg")
x <- mpg
x1 <- ggplot(x,aes(cty,hwy))+geom_count()+geom_smooth(method = "lm")

ggMarginal(x1,type = "density",fill="transparent")
#or
ggMarginal(x1,type = "histogram",fill="transparent")
#or
ggMarginal(x1,type = "boxplot",fill="transparent")
#or
ggMarginal(x1,type = "densigram")#if we don't use fill=transparent ,it will be black
#or
ggMarginal(x1,type = "violin",fill="transparent")

#extra of mpg dataset
ggplot(mpg)+geom_bar(aes(manufacturer,fill=manufacturer))
ggplot(mpg)+geom_bar(aes(class,fill=manufacturer),color="black")
ggplot(mpg)+geom_bar(aes(class,fill=manufacturer))


install.packages("ggthemes")
install.packages("multcompView")
install.packages("dplyr")
library(ggthemes)
library(multcompView)
library(dplyr)

#Analysis of Variance (ANOVA)
data("ChickWeight")
anova <- aov(weight~feed,data = chickwts)
summary(anova)

#Tukey's test
tukey <- TukeyHSD(anova)

#compact letter display
cld <- multcompLetters4(anova,tukey)
cld
#Compact letter displays (CLDs) are letters that show which treatment groups are not significantly different by some statistical test.
#Have to revise this