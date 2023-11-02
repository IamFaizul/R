install.packages("ggplot2")
library(ggplot2)
data("diamonds")
di_sample<- diamonds[seq(from=1,to=53000,by=100),]
ggplot(di_sample,aes(cut,price,color=cut))+geom_violin()+
  geom_boxplot(width=0.1)+ geom_jitter(size=0.5)
ggsave("Violin plot.pdf")
