require 'sinatra'
require 'movie'
require 'yaml'
require 'yaml/store'
require 'movie_store'

store = MovieStore.new('movie.yml')

get ('/movies') do
#    @movies = []
#    @movies[0] = Movie.new
#    @movies[0].title = 'Jaws'
#    @movies[1] = Movie.new 
#    @movies[1].title = 'Alien'
#    @movies[2] = Movie.new
#    @movies[2].title = 'terminator 2'
    @movies = store.all
    erb :index
end

get ('/movies/new') do
    erb :new
end

get ('/movies/:id') do
    #"Receiveid id: #{params['id']}"
    id = params['id'].to_i
    @movie = store.find(id)
    erb :show
end

post ('/movies/create') do
    #"Received: #{params.inspect}"
    @movie = Movie.new
    @movie.title = params['title']
    @movie.director = params['director']
    @movie.year = params['year']
    #puts YAML.dump(@movie)
    store.save(@movie)
    redirect '/movies/new' #show a new, empty form
end
