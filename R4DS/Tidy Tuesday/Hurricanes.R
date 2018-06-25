# Environment ####
library(tidyverse)
library(reshape2)
library(lubridate)
google_trends <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/puerto-rico-media/google_trends.csv")
mc_hurricanes <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/puerto-rico-media/mediacloud_hurricanes.csv")
mc_states <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/puerto-rico-media/mediacloud_states.csv")
mc_top_online_news <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/puerto-rico-media/mediacloud_top_online_news.csv")
mc_trump <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/puerto-rico-media/mediacloud_trump.csv")
tv_hurricanes <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/puerto-rico-media/tv_hurricanes.csv")
tv_hurricanes_networks <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/puerto-rico-media/tv_hurricanes_by_network.csv")
tv_states <- read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/puerto-rico-media/tv_states.csv")

# Data Description ####
# Online News Data
# Data about Online News was collected using the Media Cloud dashboard, an open source suite of tools for analyzing a database of online news.

# mediacloud_hurricanes.csv contains the number of sentences per day that mention Hurricanes Harvey, Irma, Jose, and Maria in online news.
# mediacloud_states.csv (Updated through 10/10/2017) contains the number of sentences per day that mention Puerto Rico, Texas, and Florida in online news.
# mediacloud_trump.csv (Updated through 10/10/2017) contains the number of headlines that mention Puerto Rico, Texas, and Florida, as well as headlines that mention those three locations along with 'President' or 'Trump'.
# mediacloud_top_online_news.csv contains a list of sources included in Media Cloud's "U.S. Top Online News" collection.
###
# TV News Data
# TV News Data was collected from the Internet TV News Archive using the Television Explorer tool.
# tv_hurricanes.csv - contains the percent of sentences per day in TV News that mention Hurricanes Harvey, Irma, Jose, and Maria.
# tv_hurricanes_by_network.csv - contains the percent of sentences per day in TV News per network that mention Hurricanes Harvey, Irma, Jose, and Maria.
# tv_states.csv (Updated through 10/10/2017) - contains the percent of sentences per day in TV News that mention Puerto Rico, Texas, and Florida.
###
# Google Search Queries
# Google search data was collected using the Google Trends dashboard.

# google_trends.csv - Contains data on google trend searches for Hurricanes Harvey, Irma, Jose, and Maria.

#  ####
str(google_trends)
google_trends$Day 


tv_states %>% 
  melt(id = "Date") %>% 
  ggplot(aes(x = as_date(Date), y = value, color = variable)) +
  geom_area(aes(color = variable, fill = variable), alpha = 0.2, position = position_dodge(0.8)) 



tv_hurricanes_networks %>% 
  melt(id = c("Date", "Query")) %>% 
  ggplot(aes(x = as_date(Date), y = value, color = Query)) +
  geom_area(aes(color = Query, fill = Query), alpha = 0.2, position = position_dodge(0.8)) +
  facet_grid(~variable)


mc_states %>% 
  melt(id = "Date") %>% 
  ggplot(aes(x = as_date(Date), y = value, color = variable)) +
  geom_area(aes(color = variable, fill = variable), alpha = 0.2, position = position_dodge(0.8)) 

