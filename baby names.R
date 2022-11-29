library(tidyverse)
library(MetBrewer)
library(showtext)
library(ggtext)

df1 <- read_csv("D:/Data Camp/Projects/Analyzing American Baby Name Trends/top rank female names.csv")
df2 <- read_csv("D:/Data Camp/Projects/Analyzing American Baby Name Trends/top male names over the years.csv")
df3 <- read_csv("D:/Data Camp/Projects/Analyzing American Baby Name Trends/timeless or trendy.csv")
df4 <- read_csv("D:/Data Camp/Projects/Analyzing American Baby Name Trends/test of time.csv")
df5 <- read_csv("D:/Data Camp/Projects/Analyzing American Baby Name Trends/picking baby name.csv")
df5 <- read_csv("D:/Data Camp/Projects/Analyzing American Baby Name Trends/olivia expansion.csv")
df6 <- read_csv("D:/Data Camp/Projects/Analyzing American Baby Name Trends/most years at number one.csv")
df7 <- read_csv("D:/Data Camp/Projects/Analyzing American Baby Name Trends/many male names with same name.csv")


df1 %>% 
  ggplot(aes(reorder(first_name,name_rank),name_rank, fill = first_name))+
  geom_col()+
  coord_flip()+
  scale_fill_manual(values = met.brewer("Java",10))+
  theme_minimal()+
  theme(legend.position = "none")+
  labs(title = "Top ranked female names since 1920",
       x = "rank",
       y = "name")

df2 %>% 
  ggplot(aes(year, num))+
  geom_point(size = 0.1)+
  geom_text(aes(label = first_name), size = 2)+
  theme_minimal()


df3  %>% 
  count(popularity_type, sort = TRUE)%>%
  ggplot(aes(reorder(popularity_type,n),n, fill = popularity_type))+
  geom_col()+
  coord_flip()+
  scale_fill_manual(values = met.brewer("Java",4))+
  theme_minimal()+
  theme(legend.position = "none")+
  labs(title = "Popularity Type",
       x = "popularity_type")

df4  %>% 
  rename(n = `SUM(num)`) %>% 
  ggplot(aes(reorder(first_name, n),n, fill = first_name))+
  geom_col()+
  coord_flip()+
  scale_fill_manual(values = met.brewer("Java",8))+
  theme_minimal()+
  theme(legend.position = "none")+
  labs(title = "Names that have stood the test of time",
       x = "name")

df5  %>% 
  ggplot(aes(year, num))+
  geom_line(col = "orange", size = 1)+
  geom_point(size = 1)+
  theme_minimal()+
  labs(title = "Expansion of Olivia")
  
df6  %>% 
  ggplot(aes(reorder(first_name, count_top_name),count_top_name, fill = first_name))+
  geom_col()+
  coord_flip()+
  scale_fill_manual(values = met.brewer("Java",8))+
  theme_minimal()+
  theme(legend.position = "none")+
  labs(title = "Most years at number one",
        x = "name",
        y = "count")

df7  %>% 
  ggplot(aes(year, max_num))+
  geom_line(col = "orange", size = 1)+
  geom_point(size = 1)+
  theme_minimal()+
  labs(title = "Many males with the same name")
  
  
