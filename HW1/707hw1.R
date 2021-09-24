library(dplyr)
library(lubridate)
library(ggplot2)
library(patchwork)
library(tidyr)
library(moments)
library(corrplot)
library(DescTools)
#8
setwd("~/Desktop/2021fall/biostat707/hw1")
covid_df <- read.csv("owid-covid-data.csv.gz")
covid_df <- covid_df %>% select(c("iso_code", "continent", "location", "date", "population", 
                                  "total_cases", "new_cases", "total_deaths", "new_deaths", 
                                  "total_cases_per_million", "new_cases_per_million", "total_deaths_per_million", 
                                  "new_deaths_per_million", "positive_rate", "total_vaccinations", "people_vaccinated", 
                                  "people_fully_vaccinated"))

#9
covid_df <- covid_df %>% mutate(Date = as.POSIXct(covid_df$date))
covid_df$date = covid_df$Date

#10

covid_df_1 <- covid_df%>%filter(iso_code == "USA")
#choose new_cases_per_million>0

pq1=ggplot(covid_df_1, aes(y = new_cases_per_million, x = date))  +  geom_point(size= 0.5, shape=2) + geom_line()
  xlab("Date") + ylab("NewCases/million") + ggtitle("a")
pq1

pq2=ggplot(covid_df_1, aes(y = new_deaths_per_million, x = date))  + geom_point() + geom_line() + 
  xlab("Date") + ylab("NewDeath/million") + ggtitle("b")


pq3=ggplot(covid_df_1, aes(y = positive_rate, x = date))  + geom_point() + geom_line() + 
  xlab("Date") + ylab("positive rate") + ggtitle("c")
pq3

pq4=ggplot(covid_df_1, aes(y = people_fully_vaccinated, x = date))  + geom_point(size = 0.5) + geom_line() + 
  xlab("Date") + ylab("fully_vaccinated") + ggtitle("c")
pq4

pq1+pq2+pq3+pq4+plot_layout(nrow = 4)
#q11


#q12
std_per = read.csv("student_performance.csv", sep = ";")

#q13

std_per %>% gather(Pstatus, famsup, paid, activities, nursery, higher, internet, romantic, key = "var", value = "value") %>% 
  ggplot(aes(x = value)) + geom_bar() + facet_wrap(~ var, scales = "free", nrow = 4) + theme_bw()


#q14:
p14_ab = ggplot(std_per, aes(x = absences)) + geom_histogram(aes(y = ..density..), binwidth=3, fill="#69b3a2", color="#e9ecef", alpha=0.9) + 
  geom_density()+ggtitle("Histogram of absences") + xlab("absences times") + ylab("density of absence times")
  theme(plot.title = element_text(size = 10, face = "bold"))
p14_ab


p14_g3 = ggplot(std_per, aes(x = G3)) + geom_histogram(aes(y = ..density.. ), binwidth=3, fill="#69b3a2", color="#e9ecef", alpha=0.9)+
  geom_density()+ggtitle("Histogram of G3") + xlab("grades ditributed") + ylab("density of grades")
p14_g3

p14_ab+p14_g3+plot_layout(nrow = 1)

#q15

mean((std_per%>%filter(Pstatus == "A"))$G3,na.rm=T)
mean((std_per%>%filter(Pstatus == "T"))$G3,na.rm=T)
mean((std_per%>%filter(higher == "yes"))$absences,na.rm=T)
mean((std_per%>%filter(higher == "no"))$absences,na.rm=T)

#q16
co = c("red", "blue")
mean_ab = c(mean((std_per%>%filter(higher == "yes"))$absences, na.rm = T), 
      mean((std_per%>%filter(higher == "no"))$absences, na.rm = T))
p16_1 <- ggplot(data=std_per, aes(x=absences, group=higher, color= higher)) + geom_density(adjust=1.5) +
  scale_color_manual(values = co)+geom_vline(xintercept = mean_ab, color = co) + ggtitle("abs vs eduExp")
p16_1

co1 = c("green", "black")
mean_g3 = c(mean((std_per%>%filter(higher == "yes"))$G3, na.rm = T), 
      mean((std_per%>%filter(higher == "no"))$G3, na.rm = T))
p16_2 <- ggplot(data=std_per, aes(x=G3, group=higher, color= higher)) + geom_density(adjust=1.5) +
  scale_color_manual(values = co1)+geom_vline(xintercept = mean_g3, color = co1) + ggtitle("g3 vs eduExp") 
p16_2

p16_1+p16_2+plot_layout(nrow=2)

#q17
#q18
ske_abs = skewness(std_per$absences)
ske_g3 = skewness(std_per$G3)

#19
corrplot(cor(select_if(std_per, is.numeric)), method = "color",  title = "relationship", mar=c(0,0,3,0))

#20
# the student who ace g2 exam will have high probability to ace in g3 exam

#21
m = mean(std_per$absences, na.rm=T)
s = sd(std_per$absences, na.rm=T)
zs = (std_per$absences - m)/s
z = data.frame(zs) 

p21_full = ggplot(std_per, aes(x = absences)) + geom_histogram(aes(y = ..density..), binwidth=2, fill="#69b3a2", color="#e9ecef", alpha=0.9) + 
  ggtitle("Histogram of absences") + xlab("absences times") + ylab("density of absence times")
theme(plot.title = element_text(size = 10, face = "bold"))
p21_full

z_stu = data.frame(std_per, z)
p21_redu = ggplot((z_stu%>%filter(abs(z)<=3)), aes(x = absences)) + geom_histogram(aes(y = ..density..), binwidth=2, fill="#69b3a2", color="#e9ecef", alpha=0.9) + 
  ggtitle("Histogram of absences") + xlab("absences times removed") + ylab("density of absence times")
theme(plot.title = element_text(size = 10, face = "bold"))
p21_redu

p21_full+p21_redu+plot_layout(nrow=2)

#22
std_per["Winsor"] = Winsorize(std_per$absences, minval = NULL, maxval = NULL, probs = c(0.05, 0.95),
                              na.rm = FALSE, type = 7)
p22 = ggplot(std_per, aes(x = Winsor)) + geom_histogram(aes(y = ..density..), binwidth=2, fill="#69b3a2", color="#e9ecef", alpha=0.9) + 
  ggtitle("Histogram of absences") + xlab("absences times removed") + ylab("density of absence times")
theme(plot.title = element_text(size = 10, face = "bold"))
p22

