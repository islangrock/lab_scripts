---
title: "week3_lab_questions"
output: 
  html_document:
    keep_md: true 
---

# Week 3 Lab Questions (Modified)

Please try to answer these questions to the best of your ability and email the html file to Isabelle and Yph by Wednesday. Include both code and written answers. If you have trouble, use the #r slack channel, look at the resources in the slack channel, google them, or reach out to Isabelle. 


Your Name: 

### Part 1: 
Installing packages & the data set 

```r
# Use library() to open tidyverse, stringr, (Assuming you already installed these packages from the lab)


# Install the cov data based on the directions from the lab. 
```



### Part 2: Describing the Data Set 

Write some code to find out how many variables and observations are in the google_mobility data set and provide the answers below: 

*At the top of the script/markdown panel of R, there's an Insert tab, click on it and then click R. Now you should have a "code chunck" to write your code in.*


Number of variables: 

Number of observations: 


How many dates does the data set cover? 

```r
# hint: remember length(unique(google_mobility$metro_area)) from the lab. 
```


What does running just unique(google_mobility$date) provide? 



### Part 3:  Filtering and making new data sets 

Following the tutorial from the lab, make a us_mobility data set. Remember to change the name of the region variable so it captures state.

*insert code chunk here as discussed before* 


Find the country code for Brazil and for Thailand: 

```r
# Brazil 


# Thailand
```

Filter the google_mobility data so you have results for: 

  1) Brazil AND all dates before July 1 
  2) Thailand AND Park 
  3) Egypt AND either Retail OR Workplace
  4) Poland AND all instances where the pct_diff exceeds 100 
  

Choose a US state and filter the us_mobility data set so you have a new ST_mobility data set. 



### Part 4: Grouping and Summarizing 

For your ST_mobility data set from above, what's the mean, median, and standard deviation of pct_diff for each type? 

```r
# Here's how I would write this for us_mobility data set 
# us_mobility %>% 
# group_by(type) %>%
# summarize(mean=mean(pct_diff, na.rm=TRUE), median=median(pct_diff, na.rm=TRUE), sd=sd(pct_diff, na.rm=TRUE))
```


You can add multiple terms to the grouping function. What happens if we use the us_mobility data and group_by(state, type) and then use summarize to calculate the mean and median? Write the code and describe what it does: 



Set this as a new data frame (just add state_type<- to the front of your code from above) and filter so you get the results for two different states. Do both states have similar trends or are there differences? 




*When you are finished and ready to turn this in: save the file, and then click Knit at the top of the Script/Markdown console. It might take a few minutes to fully knit but then you'll have this .Rmd file, an .md file, and a .html file. Please email us the .html file Wednesday night, before Thursday's class.* 





