#  Text Lab Answer Key 

# Set up (load packages  & data, clean data)

library(tidyverse)
library(tidytext)

captions <- read.csv("data/pres_captions.csv")


tidy_captions<- captions %>%
  unnest_tokens(word, description, token="tweets") %>%
  filter(!word %in% stop_words$word, 
         !word %in% str_remove_all(stop_words$word, "'"),
         str_detect(word,"[a-z]"))%>%
  group_by(username)

head(tidy_captions, n=20)  


# Question 1: What words get the most likes for both Biden and Harris? 
# Identity and visualize the top 10 re-occuring words that get the highest 
# average number of likes for both Biden and Harris.

## AMENDED to select only RE OCCURING WORDS! 

liked_captions <- tidy_captions %>%
  group_by(username, word) %>%
  summarize(mean_like = mean(likecount), count=n()) %>%
  filter(count>1) %>%
  top_n(10, mean_like) %>% 
  arrange(desc(mean_like)) 

liked_captions

liked_captions_mutate <- tidy_captions %>%
  group_by(username, word) %>%
  mutate(mean_like = mean(likecount)) %>%
  top_n(10, mean_like) %>% 
  arrange(desc(mean_like))


ggplot(liked_captions, aes(x=mean_like/1000, y=reorder(word, mean_like), fill=username))+
  geom_col(show.legend=FALSE)+
  facet_wrap(~username, scales="free_y", ncol=2)+
  scale_fill_manual(values=c("navy", "skyblue"))+
  labs(x= "Average Like Count (in 1000s) of Posts with Given Caption", 
       y= "")+
  ggtitle("Most Liked Caption Words")+
  theme_minimal()


# Other ways to count only re-occuring words: 

# using add_count() 

top_20_via_add_count <- tidy_captions %>%
  add_count(word) %>% 
  filter(n>1) %>%
  group_by(username, word) %>%
  summarize(mean_like = mean(likecount)) %>%
  top_n(10, mean_like) %>% 
  arrange(desc(mean_like)) 
  
  
  