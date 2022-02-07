class DiscsController < ApplicationController

  def index
    @discs = Disc.all
  end

  def show
    @disc = Disc.find(params[:id])
  end

  def edit
    @disc = Disc.find(params[:id])
  end

  def update
    disc = Disc.find(params[:id])
    disc.update(disc_params)
    redirect_to "/discs/#{disc.id}"
  end

  def disc_params
    params.permit(:name, :plastic, :speed, :available, :producer_id)
  end
end
