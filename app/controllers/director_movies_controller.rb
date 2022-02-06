class DirectorMoviesController < ApplicationController
  def index
    # @movies = Director.find(params[:id]).movies
    @director = Director.find(params[:id])
    @movies = @director.movies
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
    params.permit(:title, :length, :recently_viewed)
  end
end
