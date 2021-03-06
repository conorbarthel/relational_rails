class MoviesController < ApplicationController
  def index
    @movies = Movie.all.recently_viewed?
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy

    redirect_to "/movies"
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(movie_params)
    # movie.save
    redirect_to "/movies/#{movie.id}"
  end

  private
    def movie_params
      params.permit(:title, :length, :genre, :recently_viewed)
    end
end
