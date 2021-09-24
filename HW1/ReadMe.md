---
title: "707-HW2-Yifeng Tang"
author: "Yifeng Tang"
date: "19/09/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Part1 Shell Comd Practice:
## Q1
1. Upload the folder named "owid-covid-data.csv.gz" that you can download from the Sakai HW1 folder to your DCC home directory.  
Solution: First I have created new folder in my dcc original directory, named: 707HW1. And by using following command, I have uploaded the owid-covid-data.csv.gz from my local directory:
```{bash , eval = FALSE}
sftp yt157@dcc-login.oit.duke.edu
sftp> pwd
sftp> lcd /desktop/2021fall/biostat707/hw1
sftp> put owid-covid-data.csv.gz
sftp> quit

ssh yt157@dcc-login.oit.duke.edu
mv owid-covid-data.csv.gz 707HW1
cd 707HW1
ls
"""
yt157@dcc-login-03  ~/707HW1 $ ls
owid-covid-data.csv.gz
"""
```

## Q2
2. Look at the first 5 lines and last 5 lines of the data file owid-covid-data.csv.gz without unzipping it (This is not a very large dataset per se, but we use it to simulate a working with a very large dataset that would be difficult or even impossible to open due to its size). Find out what "gzcat" does by running "man gzcat" and use "gzcat" to complete this task.
```{bash, eval = FALSE}
yt157@dcc-login-03  ~/707HW1 $ zcat owid-covid-data.csv.gz | head -n 5
```
The output:  
iso_code,continent,location,date,total_cases,new_cases,new_cases_smoothed,total_deaths,new_deaths,new_deaths_smoothed,total_cases_per_million,new_cases_per_million,new_cases_smoothed_per_million,total_deaths_per_million,new_deaths_per_million,new_deaths_smoothed_per_million,reproduction_rate,icu_patients,icu_patients_per_million,hosp_patients,hosp_patients_per_million,weekly_icu_admissions,weekly_icu_admissions_per_million,weekly_hosp_admissions,weekly_hosp_admissions_per_million,new_tests,total_tests,total_tests_per_thousand,new_tests_per_thousand,new_tests_smoothed,new_tests_smoothed_per_thousand,positive_rate,tests_per_case,tests_units,total_vaccinations,people_vaccinated,people_fully_vaccinated,total_boosters,new_vaccinations,new_vaccinations_smoothed,total_vaccinations_per_hundred,people_vaccinated_per_hundred,people_fully_vaccinated_per_hundred,total_boosters_per_hundred,new_vaccinations_smoothed_per_million,stringency_index,population,population_density,median_age,aged_65_older,aged_70_older,gdp_per_capita,extreme_poverty,cardiovasc_death_rate,diabetes_prevalence,female_smokers,male_smokers,handwashing_facilities,hospital_beds_per_thousand,life_expectancy,human_development_index,excess_mortality
AFG,Asia,Afghanistan,2020-02-24,1.0,1.0,,,,,0.026,0.026,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,8.33,38928341.0,54.422,18.6,2.581,1.337,1803.987,,597.029,9.59,,,37.746,0.5,64.83,0.511,
AFG,Asia,Afghanistan,2020-02-25,1.0,0.0,,,,,0.026,0.0,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,8.33,38928341.0,54.422,18.6,2.581,1.337,1803.987,,597.029,9.59,,,37.746,0.5,64.83,0.511,
AFG,Asia,Afghanistan,2020-02-26,1.0,0.0,,,,,0.026,0.0,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,8.33,38928341.0,54.422,18.6,2.581,1.337,1803.987,,597.029,9.59,,,37.746,0.5,64.83,0.511,
AFG,Asia,Afghanistan,2020-02-27,1.0,0.0,,,,,0.026,0.0,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,8.33,38928341.0,54.422,18.6,2.581,1.337,1803.987,,597.029,9.59,,,37.746,0.5,64.83,0.511,

```{bash, eval = FALSE}
yt157@dcc-login-03  ~/707HW1 $ zcat owid-covid-data.csv.gz | tail -n 5
```
The output:  
ZWE,Africa,Zimbabwe,2021-08-08,116327.0,437.0,968.714,3900.0,74.0,45.286,7826.655,29.402,65.177,262.398,4.979,3.047,0.72,,,,,,,,,5215.0,1019127.0,68.568,0.351,7379.0,0.496,0.131,7.6,tests performed,2886551.0,1863913.0,1022638.0,,33154.0,61908.0,19.42,12.54,6.88,,4165.0,,14862927.0,42.729,19.6,2.822,1.882,1899.775,21.4,307.846,1.82,1.6,30.7,36.791,1.7,61.49,0.571,
ZWE,Africa,Zimbabwe,2021-08-09,116853.0,526.0,856.857,3919.0,19.0,40.571,7862.045,35.39,57.651,263.676,1.278,2.73,0.71,,,,,,,,,3369.0,1022496.0,68.795,0.227,7105.0,0.478,0.121,8.3,tests performed,2941508.0,1897123.0,1044385.0,,54957.0,66884.0,19.79,12.76,7.03,,4500.0,,14862927.0,42.729,19.6,2.822,1.882,1899.775,21.4,307.846,1.82,1.6,30.7,36.791,1.7,61.49,0.571,
ZWE,Africa,Zimbabwe,2021-08-10,117258.0,405.0,689.0,3950.0,31.0,39.143,7889.294,27.249,46.357,265.762,2.086,2.634,0.7,,,,,,,,,2631.0,1025127.0,68.972,0.177,5909.0,0.398,0.117,8.6,tests performed,,,,,,53633.0,,,,,3609.0,,14862927.0,42.729,19.6,2.822,1.882,1899.775,21.4,307.846,1.82,1.6,30.7,36.791,1.7,61.49,0.571,
ZWE,Africa,Zimbabwe,2021-08-11,117954.0,696.0,632.571,3991.0,41.0,40.0,7936.122,46.828,42.56,268.52,2.759,2.691,,,,,,,,,,6182.0,1031309.0,69.388,0.416,5524.0,0.372,0.115,8.7,tests performed,3017341.0,1932929.0,1084412.0,,,59050.0,20.3,13.01,7.3,,3973.0,,14862927.0,42.729,19.6,2.822,1.882,1899.775,21.4,307.846,1.82,1.6,30.7,36.791,1.7,61.49,0.571,
ZWE,Africa,Zimbabwe,2021-08-12,118754.0,800.0,609.286,4047.0,56.0,41.857,7989.947,53.825,40.994,272.288,3.768,2.816,,,,,,,,,,,,,,,,,,,3098542.0,1966321.0,1132221.0,,81201.0,44935.0,20.85,13.23,7.62,,3023.0,,14862927.0,42.729,19.6,2.822,1.882,1899.775,21.4,307.846,1.82,1.6,30.7,36.791,1.7,61.49,0.571,

## Q3
3. How many lines are there in this file? Find out without unzipping the file.
```{bash, eval = FALSE}
yt157@dcc-login-03  ~/707HW1 $ zcat owid-covid-data.csv.gz | wc -l
```
Output: 109101

## Q4
4. Unzip owid-covid-data.csv.gz without deleting the original zipped file. Use "man gunzip" to find out how to do that.
```{bash, eval = FALSE}
yt157@dcc-login-03  ~/707HW1 $ gunzip -k owid-covid-data.csv.gz
yt157@dcc-login-03  ~/707HW1 $ ls
```
Output: owid-covid-data.csv  owid-covid-data.csv.gz 

## Q5
5. Find out how many days of COVID-19 data *Italy* has in this dataset. Use "grep" to find the lines that contain the work "Italy" and count the lines.
```{bash, eval = FALSE}
yt157@dcc-login-03  ~/707HW1 $ grep -c Italy owid-covid-data.csv
560
```
Output: 560

## Q6
6. Look at "owid_covid_codebook.csv", which is a data dictionary for "owid_covid_data.csv". This tells us what each of the fields (columns) of the dataset means. Each row is a COVID-19 case count entry. How many columns and how many rows are there in this dataset? Find out which column indicates the country from the codebook. Use bash command to determine how many unique countries there are data in this file. I recommend using "awk" to parse the file.
```{bash, eval = FALSE}
#Rows:
wc -l owid-covid-codebook.csv
109101

#Columns:
awk '{print NF}' owid-covid-codebook.csv | tail -n 1
62

#which column idicates country_info:
awk -F ',' '$4~/country/' owid-covid-codebook.csv

#Countries:
yt157@dcc-login-03  ~/707HW1 $ awk 'BEGIN {FS = ","}; {print $3}' owid-covid-data.csv |uniq -c|wc -l
233
```
(owid_covid_codebook.csv)NUMBER OF ROWS:63; NUMBER OF COLUMNS:31;  
(owid-covid_data.csv)NUMBER OF UNIQUE COUNTRIES: 233.


## Q7
7. Use "awk" to filter by country "iso_code" so that we are only looking at COVID data from the USA. Find out the date that has the largest number of single day new cases in the USA using "sort".
```{bash, eval = FALSE}
yt157@dcc-login-03  ~/707HW1 $ awk -F ',' '$1 == "USA" {print $4,$6}' owid-covid-data.csv |sort -nr -k2 |head -1
2021-01-02 300462.0
```
Output: the largest number is 300462.0 perdat at 2021-01-02


=======

# Part for R dataframe problems: Working with Dates and EDA
initial settings: library and working directory:
```{r echo=TRUE, warning=FALSE, message=FALSE}
library(dplyr)
library(lubridate)
library(ggplot2)
library(patchwork)
library(tidyr)
library(moments)
library(corrplot)
library(DescTools)

setwd("~/Desktop/2021fall/biostat707/hw1")
```
## Q8
8. Unzip the file named “owid-covid-data.csv.gz" and load this dataset into this R Markdown file using **read.csv()**. Select the following variables from the original data file and save just these fields into a  dataframe named *covid_df*: 

iso_code  
continent   
location   
date  
population  
total_cases  
new_cases   
total_deaths  
new_deaths  
total_cases_per_million  
new_cases_per_million   
total_deaths_per_million  
new_deaths_per_million   
positive_rate  
total_vaccinations  
people_vaccinated  
people_fully_vaccinated  
```{r echo=TRUE, warning=FALSE, message=FALSE}
# read in excel as data-frame:
covid_df <- read.csv("owid-covid-data.csv.gz")
# selecting the proper variables:
covid_df <- covid_df %>% select(c("iso_code", "continent", "location", "date", "population", 
                                  "total_cases", "new_cases", "total_deaths", "new_deaths", 
                                  "total_cases_per_million", "new_cases_per_million", "total_deaths_per_million", 
                                  "new_deaths_per_million", "positive_rate", "total_vaccinations", "people_vaccinated", 
                                  "people_fully_vaccinated"))
```

## Q9
9. The **date** column in *covid_df* was automatically designated by R as a factor (which is a categorical variable designation) or a string (which is a character variable designation) and is therefore not understandable in R as a “datetime object” in its current form. The datetime objects are useful because we will be able to plot and perform relevant computations a lot easier.

+ Use the package **lubridate** to create a new vector named **Date** that contains the transformed **date** column structured as a POSIXct date-time object.
+ Replace the  **date** column in the existing dataframe *covid_df* with the updated POSIXct date-time formatted **Date** column that you’ve just created
```{r echo=TRUE, warning=FALSE, message=FALSE}
covid_df <- covid_df %>% mutate(Date = as.POSIXct(covid_df$date))
covid_df$date = covid_df$Date
head(covid_df$date)
```

## Q10
10. Use **ggplot2** to create a grid of marker+line plots containing 4 subplots in a 4 by 1 grid (4 rows by 1 column) to show the change in COVID-19 infection over time for the USA. 

+ The order of the three plots from the top to bottom of the grid should be *new_cases_per_million*, *new_deaths_per_million*, *positivite_rate*, *people_fully_vaccinated*.
+ Clearly label your y-axes and x-axes with the names of the variables and their units. (You can refer to the codebook for details about each column.) 
+ Adjust the size of the plot display so that you can see all the facets clearly when you knit. 
+ I recommend using the package "patchwork" for making multiple plots, but you can also use other packages for this purpose. 
```{r echo=TRUE, warning=FALSE, fig.width=10, fig.height=12}
covid_df_1 <- covid_df%>%filter(iso_code == "USA")
#choose new_cases_per_million>0

pq1=ggplot(covid_df_1, aes(y = new_cases_per_million, x = date))  +  geom_point(size = 0.5, shape = 3) + geom_line()+
  xlab("Date") + ylab("NewCases/million") + ggtitle("new_cases_per_million V.S time") + theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


pq2=ggplot(covid_df_1, aes(y = new_deaths_per_million, x = date))  + geom_point(size = 0.5, shape = 3) + geom_line() + 
  xlab("Date") + ylab("NewDeath/million") + ggtitle("new_deaths_per_million V.S time") + theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


pq3=ggplot(covid_df_1, aes(y = positive_rate, x = date))  + geom_point(size = 0.5, shape = 3) + geom_line() + 
  xlab("Date") + ylab("positive rate") + ggtitle("positive_rate V.S time") + theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


pq4=ggplot(covid_df_1, aes(y = people_fully_vaccinated, x = date))  + geom_point(size = 0.5, shape = 3) + geom_line() + 
  xlab("Date") + ylab("fully_vaccinated") + ggtitle("people_fully_vaccinated V.S time") + theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


pq1+pq2+pq3+pq4+plot_layout(nrow = 4)
```

## Q11
11. What are the trends you observe for these 4 different measures? E.g. When do the highest values occur for each metric? Are these metrics decreasing or increasing at the latest recorded date? Clearly explain your answer for full credit. You can also comment on how these observations correspond with public health efforts (e.g. mask-wearing, physical distancing, and stay-at-home orders). Be sure to reference trusted sources about the public health effort timing!

**Answer**:  
First, we observe that the positive rate achieves highest at the beginning of the spread. I think the reason is that, at that time, the country had no enough resource to do the test. Thus, only those who have serious symptoms could do the test, which leads to the high positive rate. However, in the following time, everyone could do the tests, and the positive rate remains low even the new_case_per_million goes up. 
We also observe the new_cases_per_million and new_death_per_million have almost the same trends. However, the increasing trend of new_death_per_million at the beginning is much larger than new_cases. The reason I think is also due to the limit resources. While starting at the July 2021, the increasing rate of new_death is less than new_cases_positive. I think the reason is due to the large amount of population who have already taken vaccines. 

# Exploratory Data Analysis and Data Preprocessing
## Q12
12. Load the dataset named "student_performance.csv" that can be downloaded from Sakai. This data covers student achievement in secondary education of two Portuguese schools.  You can find information about this dataset from the text file, also available in Sakai, named "student_performance_info.csv", where the column names and variables are explained.
```{r echo=TRUE, warning=FALSE, message=FALSE}
std_per = read.csv("student_performance.csv", sep = ";")
head(std_per)
```

## Q13
13. Use ggplot and facet_warp() to plot a bar plot for the following categorical variables in this dataset:

Pstatus  
famsup  
paid  
activities  
nursery  
higher  
internet  
romantic  

+ When using facet_wrap(), you are encouraged to use 2 plots in each row. 
+ Adjust the fig.height and fig.width variables in your R chunk definition to show the plots more clearly.
```{r echo=TRUE, warning=FALSE, fig.width=10, fig.height=10}
std_per %>% gather(Pstatus, famsup, paid, activities, nursery, higher, internet, romantic, key = "var", value = "value") %>% ggplot(aes(x = value)) + geom_bar(fill="#69b3a2") + facet_wrap(~ var, scales = "free", nrow = 4) + theme_bw()  + geom_text(stat='count', aes(label=..count..))
```

## Q14
14. Using ggplot, draw 2 histograms plus density function curves of *absences* and *G3* in a 1 by 2 grid

+ I recommend using the library "patchwork" for making the 2-plot grid. Label your axis and legend appropriately for full credit. 
+ You should also choose a suitable binwidth for each variable. 
```{r echo=TRUE, warning=FALSE, fig.width=10, fig.height=8}
p14_ab = ggplot(std_per, aes(x = absences)) + geom_histogram(aes(y = ..density..), binwidth=3, fill="#69b3a2", color="#e9ecef", alpha=0.9) + 
  geom_density()+ggtitle("Histogram and density curve of absences") + xlab("absences times") + ylab("density of absence times") +    
  theme_bw() + theme(plot.title = element_text(size = 15, hjust = 0.5))

p14_g3 = ggplot(std_per, aes(x = G3)) + geom_histogram(aes(y = ..density.. ), binwidth=4, fill="#69b3a2", color="#e9ecef", alpha=0.9)+
  geom_density()+ggtitle("Histogram and density curve of of G3") + xlab("grades ditributed") + ylab("density of grades") + theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


p14_ab+p14_g3+plot_layout(nrow = 1)
```

## Q15
15. Answer the following questions:

+ What is the average final grade of subjects in this dataset whose parents are separated?
+ What is the average final grade of subjects in this dataset whose parents remain together?

+ What is the average number of absences of subjects in this dataset who want to participate in higher education?
+ What is the average number of absences of subjects in this dataset who don't plan to participate in higher education?
```{r echo=TRUE, warning=FALSE}
a1 = mean((std_per%>%filter(Pstatus == "A"))$G3,na.rm=T)%>%round(3)
a2 = mean((std_per%>%filter(Pstatus == "T"))$G3,na.rm=T)%>%round(3)
a3 = mean((std_per%>%filter(higher == "yes"))$absences,na.rm=T)%>%round(3)
a4 = mean((std_per%>%filter(higher == "no"))$absences,na.rm=T)%>%round(3)
```
The average final grade of subjects in this dataset whose parents are separated is `r a1`  
The average final grade of subjects in this dataset whose parents remain together is `r a2`  
The average number of absences of subjects in this dataset who want to participate in higher education is `r a3`   
The average number of absences of subjects in this dataset who want to participate in higher education is `r a4` 

## Q16
16. Now, using a similar 1 by 2 grid, overlay two separate density curves for the two groups with different preferences for higher education, for each variable (feature) from question 3.  For these figures, plot just the density curve (without the density histogram bins). Add a vertical line for each of the two density curves on each plot at the mean value for that feature for each group  (grouped by preference for higher education). For example, in the first entry of the grid, which is row 1 and column 1 of the 1-by-2 grid, there should be two density plots drawn in two colors for the two different choices in whether one wants to pursue higher education or not.
```{r echo=TRUE, warning=FALSE, fig.width=10, fig.height=10}
co = c("red", "blue")
mean_ab = c(mean((std_per%>%filter(higher == "no"))$absences, na.rm = T), 
      mean((std_per%>%filter(higher == "yes"))$absences, na.rm = T))
p16_1 <- ggplot(data=std_per, aes(x=absences, group=higher, color= higher)) + geom_density(adjust=1.5) +
  scale_color_manual(values = co)+geom_vline(xintercept = mean_ab, color = co) + ggtitle("abs vs eduExp") + 
  theme_bw() + theme(plot.title = element_text(hjust = 0.5)) 


co1 = c("green", "black")
mean_g3 = c(mean((std_per%>%filter(higher == "no"))$G3, na.rm = T), 
      mean((std_per%>%filter(higher == "yes"))$G3, na.rm = T))
p16_2 <- ggplot(data=std_per, aes(x=G3, group=higher, color= higher)) + geom_density(adjust=1.5) +
  scale_color_manual(values = co1)+geom_vline(xintercept = mean_g3, color = co1) + ggtitle("g3 vs eduExp") + 
  theme_bw() + theme(plot.title = element_text(hjust = 0.5)) + guides(fill=guide_legend(title="Preference for higher education"))


p16_1+p16_2+plot_layout(nrow=2) 
```

## Q17
17. What are your observations from the previous plots? E.g. Do any of the features visually show a strong difference in means or in shape of the data between the students who want to pursue higher education and those who don't? For each feature, which diagnosis group seems to have a higher average value? Clearly explain your answer to receive full credit.  

**Answer**: For the absences, there is no hugh difference between higher expectation and no high expectation.But we still could find for the students who have high expectations, they have less absences than those who don't. While for the g3 grade, the average g3 grade of students who have high expectations are much higher than those who don't. 

## Q18
18. By observing the histogram and density plots of the variables "absences" and "G3", answer the following questions for each of the variables "absences" and "G3":  
  
a. Is the data for each predictor skewed?  
b. Does it have positive skewness or negative skewness?   
c. Compute the skewness using the definition from the lecture.  
d. According to the criterion introduced in the lecture, is the dataset moderately skewed or highly skewed?  
```{r echo=TRUE, warning=FALSE}
ske_abs = skewness(std_per$absences)
ske_g3 = skewness(std_per$G3)
```
**Answer**: We observe the data of absences is positive skewed, while the data of g3 is almost not skewed.  
The skewness of absences is r`ske_abs`, and the skewness of g3 is  r`ske_g3`.


## Q19
19. Correlation plots are a way to visualize multivariate relationships. Using the corrplot package, make a correlation plot of the numeric fields in the dataframe. Clearly label your axis and legend for full credit. 
```{r echo=TRUE, warning=FALSE, fig.width=8, fig.height=8}
corrplot(cor(select_if(std_per, is.numeric)), method = "color",  title = "relationship", mar=c(0,0,3,0))
```

## Q20 
20 Which factor has the strongest correlation with the final grade “G3”? Does this observation make sense to you, and why or why not?  

**Answers**:We observe the correlation between g3 and g2, g3 and g1 is closed to 1(dark blue). The student who ace g2 or g1 exam will have high probability to ace in g3 exam. That make sense to me. The students who ace g1 or g2 means they have good study skills and better understanding the knowledge. Thus, they have high probability to ace the g3. 

## Q21
Calculate the Z scores of the absences and determine if there are any outliers for z > 3. Plot a histogram of absences. Remove the outliers (defined by z>3) and plot absences again.
```{r echo=TRUE, warning=FALSE, fig.width=10, fig.height=10}
m = mean(std_per$absences, na.rm=T)
s = sd(std_per$absences, na.rm=T)
zs = (std_per$absences - m)/s
z = data.frame(zs) 

p21_full = ggplot(std_per, aes(x = absences)) + geom_histogram(aes(y = ..density..), binwidth=2, fill="#69b3a2", color="#e9ecef", alpha=0.9) + 
  ggtitle("Histogram of absences") + xlab("absences times") + ylab("density of absence times") + 
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))


z_stu = data.frame(std_per, z)
p21_redu = ggplot((z_stu%>%filter(abs(z)<=3)), aes(x = absences)) + geom_histogram(aes(y = ..density..), binwidth=1, fill="#69b3a2", color="#e9ecef", alpha=0.9) + 
  ggtitle("Histogram of absences") + xlab("absences times (outliers_removed)") + ylab("density of absence times") + 
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))

p21_full+p21_redu+plot_layout(nrow=2)
```

## Q22
```{r echo=TRUE, warning=FALSE, fig.width=8, fig.height=8}
std_per["Winsor"] = Winsorize(std_per$absences, minval = NULL, maxval = NULL, probs = c(0.05, 0.95),
                              na.rm = FALSE, type = 7)
p22 = ggplot(std_per, aes(x = Winsor)) + geom_histogram(aes(y = ..density..), binwidth=2, fill="#69b3a2", color="#e9ecef", alpha=0.9) + 
  ggtitle("Histogram of absences") + xlab("absences times removed") + ylab("density of absence times")+
  theme_bw() + theme(plot.title = element_text(hjust = 0.5))
p22

```
