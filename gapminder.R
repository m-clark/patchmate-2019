
library(tidyverse)

# Import data -------------------------------------------------------------

le0 = readr::read_csv('data/gap_minder/life_expectancy_years.csv')
pop0 = readr::read_csv('data/gap_minder/population_total.csv')
gdp0 = readr::read_csv('data/gap_minder/income_per_person_gdppercapita_ppp_inflation_adjusted.csv')



# Make long form ----------------------------------------------------------


# need to change to pivot* when tidyr updates

glimpse(le0)
le = le0 %>% 
  gather(key = year, value = lifeExp, -country)
head(le)

glimpse(pop0)
pop = pop0 %>% 
  gather(key = year, value = pop, -country)
head(pop)

glimpse(gdp0)
gdp = gdp0 %>% 
  gather(key = year, value = gdpPercap, -country)
head(gdp)

gapminder_current = left_join(le, pop) %>% 
  left_join(gdp) %>% 
  left_join(gapminder %>% select(country, continent)) %>% 
  mutate(year = as.integer(year))

save(gapminder_current, file = 'data/gap_minder/gapminder.RData')
