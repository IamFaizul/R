install.packages("gganimate")
library(gganimate)
library(ggplot2)
install.packages("gifski")
install.packages("av")
library(gifski)
library(av)
data()
install.packages("gapminder")
head(gapminder)
library(gapminder)
#Simple graph
ggplot(gapminder,aes(gdpPercap,lifeExp))+geom_point() 
#Size of population
ggplot(gapminder,aes(gdpPercap,lifeExp,size=pop,col=country))+
  geom_point(show.legend = F) #Color code by country

#Color change for beauty
library(viridis)
AN1 <- ggplot(gapminder,aes(gdpPercap,lifeExp,size=pop,col=country))+
  geom_point(show.legend = F,alpha=0.8)+
  scale_color_viridis_d()+
  scale_size(c(1,11))+
  scale_x_log10()+
  labs(title = 'Year: {frame_time}', x="GDP Per Capita", y= "life Expectency")+
  transition_time(year)+ease_aes("linear")
AN1
animate(AN1, duration = 5, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")


#with facet_wrap
library(viridis)
AN1 <- ggplot(gapminder,aes(gdpPercap,lifeExp,size=pop,col=country))+
  geom_point(show.legend = F,alpha=0.8)+
  scale_color_viridis_d()+
  scale_size(c(1,11))+
  scale_x_log10()+
  facet_wrap(~continent,nrow=1)+ "we have to use facet_wrap()function if we want separate animated graphs"
labs(title = 'Year: {frame_time}', x="GDP Per Capita", y= "life Expectency")+
  transition_time(year)+ease_aes("linear")
AN1
animate(AN1, duration = 5, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")

#Tails

AN1 <- ggplot(gapminder,aes(gdpPercap,lifeExp,size=pop,col=country))+
  geom_point(show.legend = F,alpha=0.8)+
  scale_color_viridis_d()+
  scale_size(c(1,11))+
  scale_x_log10()+
  labs(title = 'Year: {frame_time}', x="GDP Per Capita", y= "life Expectency")+
  transition_time(year)+shadow_wake(wake_length = 0.1,alpha =FALSE )+
  ease_aes("linear")
AN1
animate(AN1, duration = 5, fps = 20, width = 200, height = 200, renderer = gifski_renderer())
anim_save("output.gif")

#Animated line plot

lp <- ggplot(airquality,aes(Day,Temp,group=Month,color=factor(Month)))+
  geom_line()+
  scale_color_viridis_d()+
  labs(x="Day of Month",y="Temperature")+
  theme(legend.position = "top")
lp  
lp+transition_reveal(Day)+
geom_point()+
  transition_reveal(Day)

#Animated bar plot
library(dplyr)
mean.temp <- airquality %>%
  group_by(Month)%>%
  summarise(Temp=mean(Temp))
mean.temp
bp <- ggplot(mean.temp,aes(Month,Temp,fill=Temp))+
  geom_col()+
  scale_fill_distiller(palette = "Reds",direction=1)+
  theme_minimal()+
  theme(
    panel.grid = element_blank(),
    panel.grid.major.y =element_line(color="white"),
    panel.ontop = TRUE
  )
bp1 <- bp+transition_states(Month,wrap = FALSE) +
  shadow_mark()+
gganimate(bp1,duration=10,fps=20,width=300,height=300,renderer = gifski_renderer())
anim_save("output2.gif")
  

#Tips if error comes
install.packages("devtools")
library(devtools)
devtools::install_github("thomasp85/gganimate")


#Information
# transition_*() - defines how the data should be spread out and how it relates to itself across time.
# view_*() - defines how the positional scales should change along the animation.
# shadow_*() - defines how data from other points in time should be presented in the given point in time.
# enter_*()/exit_*() - defines how new data should appear and how old data should disappear during the course of the animation.
# ease_aes() -defines how different aesthetics should be eased during transitions
