class DirectorMoviesController < ApplicationController
  def index
    @movies = Director.find(params[:id]).movies
  end
end
