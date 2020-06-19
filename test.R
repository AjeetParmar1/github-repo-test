options(digits = 3)    # report 3 significant digits
library(tidyverse)
library(titanic)

titanic <- titanic_train %>%
  select(Survived, Pclass, Sex, Age, SibSp, Parch, Fare) %>%
  mutate(Survived = factor(Survived),
         Pclass = factor(Pclass),
         Sex = factor(Sex))

params <- titanic %>%
  filter(!is.na(Age)) %>%
  summarize(mean = mean(Age), sd = sd(Age))

#titanic %>% ggplot(aes(x = Age, color = Sex)) + 
  #geom_histogram()

titanic %>% ggplot(aes(Age, after_stat(count), color = Survived)) + 
  geom_density() + facet_grid(Sex~Pclass)
