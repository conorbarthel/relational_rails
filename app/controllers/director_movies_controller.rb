class DirectorMoviesController < ApplicationController
  def index
    # @movies = Director.find(params[:id]).movies
    director = Director.find(params[:id])
    @movies = director.movies
  end
end
