require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'

# A setup step to get rspec tests running.
configure do
  root = File.expand_path(File.dirname(__FILE__))
  set :views, File.join(root,'views')
end

# on this page show erb to / page


get '/' do
	erb :index
end

get '/search' do
  movie = params[:movie]
  # goes to search url and gets the movie 
  results = Typhoeus.get("http://www.omdbapi.com", :params => {:s => movie })
  # gets the results of the search 
  imdb_data = JSON.parse(results.body)
  # saves just the parsed body as a string
  @movie_result = imdb_data["Search"]
  erb :search
end

get '/show/:imdbID' do
  search = params[:imdbID]
  results = Typhoeus.get("http://www.omdbapi.com", :params => {:i => search})
 @imdb_data = JSON.parse(results.body)
erb :show
end

# if search == "" || search == nil
# return "This movie does not exist"
# end

# # if results != do
# # "Movie Does not Exist"

# end
