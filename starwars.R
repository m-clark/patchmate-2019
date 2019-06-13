library(rwars)

films = get_all_films(parse_result = T)
people1 = get_all_people(parse_result = T)
people2 = get_all_people(getElement(people1,"next"), parse_result = T)
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


 save.image('data/starwars.RData')


map(all, function(x) data.frame(x$results))
films$results
tibble(people$results)


people_df = map_df(people$results, function(x) as_tibble(x[1:10]))

get_all_results = function(fn) {
  res = fn(parse_result = T)
  if (is.null(getElement(res, "next"))) return(res)
  page = as.integer(str_sub(getElement(res, "next"), start = -1))
  
  while(page > 1) {
    init =   fn(getElement(res, "next"))
    res = append(res, init))
    page = as.integer(str_sub(getElement(res, "next"), start = -1))
  }
  
  res
}

debugonce(get_all_results)
test = get_all_results(get_all_planets)
