# Week 6 Answers : Sample Size and Randomness 

# read through and try out this code and compare the answers with your own. 
# Remember that r code can be written in many different ways.
# yours might not 100% match what I've written and we've added randomness into the mix
# so our answers will not exactly match even if our code does for question 2. Focus on the logic not the exact answer! 


library(AER) 
library(tidyverse)
library(randomizr)

# load data 
data("CASchools")


# Question 1: 

# (a) Assign a new treatment variable for the case where the schools with the most expenditure per student self select into the treatment. 
    # Roughly half of the schools should be in your treatment group and your control group.

median(CASchools$expenditure)

CASchools<- CASchools %>%   
  mutate(treatment1a = if_else(expenditure>median(expenditure), 1, 0)) # set those with expenditure larger than 5214 as 1 for treatment. All else are in 
          # control (0). 

table(CASchools$treatment1a) # great, exactly half are in each condition

# (b) Find the correlations between expenditure and treatment, expenditure and computers, and treatment and computers.

cor(CASchools$expenditure, CASchools$treatment1a)
cor(CASchools$expenditure, CASchools$computer)
cor(CASchools$treatment1a, CASchools$computer)

# (c) Make a table that includes the mean, median, min and max of each group's student count, teacher count, and lunch count. 

CASchools %>%
  group_by(treatment1a) %>%
  summarize(meanS = mean(students), medianS=median(students), minS=min(students), maxS=max(students),
            meanT=mean(teachers), median=median(teachers), minT=min(teachers), maxT=max(teachers), 
            meanL=mean(lunch), medianL=median(lunch), minL=min(lunch), maxL=max(lunch))

 # alternatively we could look at these statistics by filtering and using summary() 
CASchools %>%
  filter(treatment1a==0) %>%
  summary()

CASchools %>%
  filter(treatment1a==1)%>%
  summary()

  
# Question 2: 

# Randomly assign all 420 schools into either treatment or control conditions.

CASchools$treatment2<- simple_ra(N=420)
table(CASchools$treatment2)

# Build a scatter plot for control and treatment groups (use geom_jitter) based on number of computers. 
# Add a blue dot to each group representing the mean. 


ggplot(CASchools, aes(y=computer, x=as.character(treatment2)))+ 
  geom_jitter()+
  stat_summary(fun=mean, geom="point", aes(group=as.character(treatment2)), color="blue", size=5)+
  xlab("Treatment Group") +
  theme(legend.position = "none") 


