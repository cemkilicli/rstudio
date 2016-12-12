getwd()
names(pf)
library("dplyr")
library("ggplot2")

ggplot(aes(x = age, y = friend_count), 
       data = subset(pf, !is.na(gender))) +   geom_line(aes(color = gender), stat = 'summary', fun.y = median)


### Third Qualitative Variable

pf.fc_by_age_gender <- pf %>%  #create a new data frame
  filter(!is.na(gender)) %>% #filter na gender from pf
  group_by(age, gender) %>% #gorup by age / gender
  summarise(mean_friend_count = mean(friend_count), 
            median_friend_count = median(friend_count), #create summary data 
            n = n()) %>%
  ungroup() %>% #??????
  arrange(age) #arrange by age

head(pf.fc_by_age_gender) #see in table format



### Plotting Conditional Summaries

ggplot(aes(x = age, y = median_friend_count), #plot the data frame
       data = pf.fc_by_age_gender) +   
  geom_line(aes(color = gender), stat = 'summary', fun.y = median)



### Wide and Long Format
"""
age | gender | mean_friend_count | median_friend_count | n     ----->    age | male | female
13 | female |               314 |                 324 | 45    ----->     13 |  414 |    514 --> median friend count

"""



### Reshaping Data

install.packages('reshape2')
library(reshape2)

pf.fc_by_age_gender_wide <- dcast(pf.fc_by_age_gender,
                                  age ~ gender,
                                  value.var = 'median_friend_count')


head(pf.fc_by_age_gender_wide)



