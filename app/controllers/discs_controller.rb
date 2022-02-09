class DiscsController < ApplicationController

  def index
    @discs = Disc.all.where(available: true)
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

  def destroy
    Disc.destroy(params[:id])
    redirect_to "/discs"
  end

  private
    def disc_params
      params.permit(:name, :plastic, :speed, :available, :producer_id)
    end
end
