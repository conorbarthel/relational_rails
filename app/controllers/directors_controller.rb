class DirectorsController < ApplicationController
  def index
    @directors = Director.all.order(created_at: :desc)
  end

  def show
    @director = Director.find(params[:id])
  end

  def new
  end

  def create
    director = Director.create(director_params)
    redirect_to "/directors"
  end

  def director_params
    params.permit(:name, :awards_won, :active)
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    director = Director.find(params[:id])
    director.update({
      name: params[:name],
      active: params[:active],
      awards_won: params[:awards_won]
      })
    director.save
    redirect_to "/directors/#{director.id}"
  end
end
