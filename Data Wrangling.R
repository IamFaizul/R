# Data Wrangling & Data Transformation
install.packages("tidyverse")
install.packages("tidyr")
library(tidyverse)
library(tidyr)

d <- diamonds
d1 <- as.data.frame(d)
d2 <- as.tibble(d)
glimpse(d)
d$carat <- as.numeric(d$carat)
glimpse(d$carat)
class(d$carat)

# Data types are more important than data itself
# Data structure is more important than data significance

### Step-1 : Set your home directory (Ctrl+Shift+H)
### Step-2 : Import your data in R (readxl,readcsv)
### Step-3 : Data structure and types
### Step-4 : Data Transformation and tidy tips & tricks
### Step-5 : 


d <- diamonds
glimpse(d)
d1 <- data.frame(d)
print(d1)
d2 <- as_tibble(d)
# For information about tibble, visit stateducation.com


# Manipulating data
install.packages("dslabs")
library(dslabs)
d <- diamonds
# Add a column
as_tibble(d)
d <- mutate(d,a=x+y)
as_tibble(d)

d <- mutate(d,mean=mean(x+y+z))
as_tibble(d)

d1 <- mutate(d, sd=sd(x+y+z))
as_tibble(d1)

#Subsetting

as_tibble(d)
d_a1 <- filter(d,z>5)
as_tibble(d_a1)

d_a2 <- filter(d,cut=="Fair") #Subsetting a character variable
as_tibble(d_a2)

# Subsetting using select function

d_a3 <- select(d ,cut,y,z)
as_tibble(d_a3)


# Task

m <- murders
as_tibble(m)
m_1 <- filter(m,m$population> 5^6)
as_tibble(m_1)


m_2 <- filter(m,m$region=="South")
as_tibble(m_2)

barplot(m$population,m$total)
library(ggplot2)
ggplot(m,aes(m$population,m$total))+
  geom_point()+
  geom_line()+
  geom_violin()+
  geom_jitter()
 

# Less code for more output
# dplyr pipe %>% (Ctrl+shift+m)
### 1- data set
### 2- filter
### 3- select
### 4- Mutate

d <- diamonds %>% 
  filter(cut=="Ideal") %>% 
  select(cut,color,x) %>% 
  mutate(y=x*2)
as_tibble(d)  


# Summarize Function

x <- mtcars
as.tibble(x)
class(x$mpg)
summarise(x,iqr= IQR(x$mpg))
count(x,mpg)# It shows how many particular value there are in

x %>% summarise(avg = mean(x$mpg)) #we can also summarize data by using pipe


# group by

mtcars %>% 
  group_by(gear) %>% 
  summarise(avg = mean(mpg))


# Manipulate data

x <- mtcars
x1 <- filter(x,mpg>20)
x1 <- slice(x,20:25)
x1 <- slice_sample(x,n=11,replace = FALSE)
x1 <- slice_min(x,mpg,prop = 0.5)
x1 <- slice_head(x,n=11)
x1 <- head(x)


# Order data

data(cars)
cars <- add_row(cars,speed=20)
cars[is.na(cars)]=0 # To convert N/A into Zero

# Manipulating variables

x2 <- pull(x,wt)
x2 <- select(x,x$mpg)

x3 <- summarise(x,across(everything(),mean)) #Shows mean of every variable
x4 <- summarise(x,across(everything(),sd)) #Shows sd of every variable
x4
