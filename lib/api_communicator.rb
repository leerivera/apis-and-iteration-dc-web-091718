require 'rest-client'
require 'json'
require 'pry'

STAR_WARS_API_URL = 'http://www.swapi.co/api/people/'

def get_character_movies_from_api(character)
  #make the web request
 
  response_hash = api_request(STAR_WARS_API_URL)
  
  # NOTE: in this demonstration we name many of the variables _hash or _array. 
  # This is done for educational purposes. This is not typically done in code.
 
  
  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  character_info = response_hash["results"].find{|name| name['name'] == character}

  film_urls = character_info["films"]

   film_urls.map do |film_urls|
    api_request(film_url)
  end
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each do |films|
    puts film["title"]
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

def capitalize(character)
  character = character.split.map{|string| string.capitalize}.join(" ")
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
def api_request(url)
    response_string = RestClient.get(film_url)
    JSON.parse(response_string)

end