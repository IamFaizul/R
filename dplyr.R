data <- data.frame(x=1:5,
                   y=c(1,1,7,3,1),
                   z=c("A","B","C","D","A"))
library(dplyr)

arrange(data,y)   #Arrange any particular column in ascending order

filter(data,y==1)  #Extracts the data you need

mutate(data,a=x+y) #Adds a new column

pull(data,y) #Extracts any particular column

rename(data,b=y) #Renames column

sample_n(data,3) #Without seed

set.seed(1235)    #When we use sample_n ,it basically shows 
sample_n(data,3)  # different samples everytime(randomly)
                  # But using seed function actually fix a particular
                  #sample that we can use further and everytime we run
                  #with seed we find the same sample.
                  # As I know 1235 or any other value has not much significance


select(data,c(x,y)) #For selecting more than 1 column



