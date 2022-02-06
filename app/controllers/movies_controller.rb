class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    movie.save
    redirect_to "/movies/#{movie.id}"
  end

  def movie_params
    params.permit(:title, :length, :genre, :recently_viewed)
  end
end
