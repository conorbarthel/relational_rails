class DirectorMoviesController < ApplicationController
  def index
    @director = Director.find(params[:id])
    if params[:sort] == 'asc'
      @movies = @director.alphabetize
    elsif params[:filter]
      @movies = @director.movies.above_length(params[:filter])
      binding.pry
    else
      @movies = @director.movies
    end
  end

  def new
    @director = Director.find(params[:id])
  end

  def create
    director = Director.find(params[:id])
    director.movies.create(movie_params)

    redirect_to "/directors/#{director.id}/movies"
  end

  def movie_params
    params.permit(:title, :length, :genre, :recently_viewed)
  end
end
