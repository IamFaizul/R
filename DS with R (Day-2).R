library(tinytex)
qqnorm(iris$Sepal.Length)
sd(iris$Sepal.Length)
mean(iris$Sepal.Length)
ncol(iris)
x <- seq(from=1 ,to=10000,by=20)
for(i in x){
  print(i)
}
y <- seq(from=1 ,to=10000,by=20)
z <- x*(2.71^-(x*(y+1)))
plot(z)

library(ggplot2)
data("ToothGrowth")

ToothGrowth$dose <- as.factor(ToothGrowth$dose)
ggplot(ToothGrowth,aes(dose,len))+
  geom_boxplot()
#Use following concept to plot significance level

install.packages("ggsignif")
library(ggsignif)

ggplot(ToothGrowth,aes(dose,len))+
  geom_boxplot()+
  geom_bar(stat = "identity")+
  geom_signif(comparisons =list(c("0.5","1"),
                                c("0.5","2"),
                                c("1","2")),
              map_signif_level = TRUE,
              y_position = c(30,35,40))+theme_minimal()

# How to show statistical lettering on any plot
chickwts
model <- aov(chickwts$weight~chickwts$feed)
tukey <- TukeyHSD(model)
tukey

# Lettering file
install.packages("multcompView")
library(multcompView)
abc <- multcompLetters4(model,tukey)
abc


# The Tukey HSD ("honestly significant difference" or 
# "honest significant difference") test is a 
# statistical tool used to determine if the relationship 
# between two sets of data is statistically significant
