library(tidyverse)
library(rwars)


# get preliminary results -------------------------------------------------

films = get_all_films(parse_result = T)
people = get_all_people(parse_result = T)
planets = get_all_planets(parse_result = T)
species = get_all_species(parse_result = T)
starships = get_all_starships(parse_result = T)
vehicles = get_all_vehicles(parse_result = T)

all = list(films = films,
           people = people,
           planets = planets,
           species = species,
           starships = starships,
           vehicles = vehicles)


save.image('data/starwars_raw.RData')


load('data/starwars_raw.RData')


source('get_all_results.R')


# get all the results (for real) ------------------------------------------

films_df = get_all_results(get_all_films)
people_df = get_all_results(get_all_people)
planets_df = get_all_results(get_all_planets)
species_df = get_all_results(get_all_species)
starships_df = get_all_results(get_all_starships)
vehicles_df = get_all_results(get_all_vehicles)


# extract names -----------------------------------------------------------


film_names = films_df$title
people_names = people_df$name
planets_names = planets_df$name
species_names = species_df$name
starships_names = starships_df$name
vehicles_names = vehicles_df$name

save(film_names,
     people_names,
     planets_names,
     species_names,
     starships_names,
     vehicles_names,
     file = 'data/starwars_names.RData')



# convert the former urls to labeled values -------------------------------

films_df     = convert_all(films_df)
people_df    = convert_all(people_df)
planets_df   = convert_all(planets_df)
species_df   = convert_all(species_df)
starships_df = convert_all(starships_df)
vehicles_df  = convert_all(vehicles_df)


save(films_df,
     people_df,
     planets_df,
     species_df,
     starships_df,
     vehicles_df,
     file = 'data/starwars_df.RData')



