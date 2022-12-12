##########  -  Chi Squared Goodness of fit test

library(tidyverse)

view(iris)

flower <-  iris %>% 
  mutate(size = cut(Sepal.Length,breaks = 3, labels = c("small","medium","large"))) %>% 
  select(Species,size)

# Question: is there a statistically significant difference in the proportion of flowers that are small, medium and large (alpha = 0.05)

# HO: The proportion of flowers that are
# small, medium sized and large are equal

# H1: The proportion of flowers that are  small, medium sized and large are not equal

table(flower$size)

flower %>%
  select(size) %>%
  table() %>% 
  chisq.test()

 # p value = 0.0000006673

 # so....if the proportions were equal,

 # the probability of sample data
 # providing a difference of this magnitude
 # or more is < 0.05 therefore.

 # Reject the HO (that the proportions are equal) 
 # Evidence that the proportions are not equal



####### - Chi Squared test of independence

# HO: The variables are independent
# There is no relationship between the variables
# Knowing the value of one variable # does not help to predict the
# value of the other variable

#H1: The variables are dependent
#There is a relationship between the variables
# Knowing the value of one variable does helps to predict the value of the other variable

view(iris)

flower <-  iris %>% 
  mutate(size = cut(Sepal.Length,breaks = 3, labels = c("small","medium","large"))) %>% 
  select(Species,size)

table(flower)

flower %>%
  table() %>% 
  chisq.test()

# p-value < 2.2e-16
# the probability of sample data
# providing a difference of this magnitude
# or more is < 0.05 therefore.
# so we will reject the null hypothesis 
# and accept the alternative hypothesis that this is statistically significant