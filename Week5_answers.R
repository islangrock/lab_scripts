# Answers and Code for Week 5 Lab (Scales & Reliability)

# read through and try out this code and compare the answers with your own. 
# Remember that r code can be written in many different ways.
# yours might not 100% match what I've written even if you get the same answer. That's ok! 


# need to install the following packages and data 
library(tidyverse)
library(psych)
library(car)
anes<- read.csv("~/Desktop/methods_522/data/anes_2012.csv")

###  A. Build a scale measure from the Presidential Trait Questions (see below)

trait <- anes %>%   
  select(ctrait_dpcmoral:ctrait_dpchonst)   # select the columns/questions we want to be part of our scale

trait[trait<0]<-NA   # remember to make everything less than 0 an NA since they connate non-responses 

### B. Provide cronbach's alpha for the scale. Do you think this is a reliable scale? 

alpha(trait)    # alpha = .95. 
        #An alpha aove .7 or .8 is quite reliable so we can assume this trait scale is very reliable 

    # alternative answer: 
      # all our questions are worded in the same direction but we could still use the keys function of alpha 
alpha(trait, keys=c(1,1,1,1,1,1))
      # note how we get the exact same answer! 
  
### C. Test the predictive validity of the scale by finding the correlation between the scale and the 
#presidential approval question: presapp_job: 
#Do you APPROVE (1) or DISAPPROVE (2) of the way Barack Obama is handling his job as President?

  # First we want to include presapp_job in our df 

trait_test <- anes  %>%
  select(ctrait_dpcmoral:presapp_job)

  # have to remove the negatives again! 

trait_test[trait_test<0] <-NA

  # now sum across rows 
trait_test <- trait_test %>%
  mutate(total_trait = rowSums(.[1:6]))  # See section below for other ways to make this 

    # We should also note that we're excluding anyone who wrote an NA for any quesiton from our scale.
    # This is a choice! We could decide not to do this and make them 0s. What we decide should depend on our 
    # research question. 

  # finally we can run the correlation 

cor(trait_test$total_trait, trait_test$presapp_job, use="complete.obs")

  # .776 is a high correlation! This scale seems to be predictively valid! 



# Alternative ways of summing across rows (C)

trait_test$total_trait_2 <- rowSums(trait_test[1:6]) # a base r version 

trait_test <- trait_test %>%    # a version using column names rather than column index 
  mutate(total_trait_3= rowSums(cbind(ctrait_dpcmoral, ctrait_dpclead, ctrait_dpccare,
                                      ctrait_dpcknow, ctrait_dpcint, ctrait_dpchonst)))

summary(trait_test) # not how all our total traits have the same distribution! 



