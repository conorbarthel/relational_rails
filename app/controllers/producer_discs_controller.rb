class ProducerDiscsController < ApplicationController

  def index
    @producer = Producer.find(params[:id])
    @discs = Producer.find(params[:id]).discs
  end

  def new
  end

  def create
    new_disc = Disc.create(disc_params)
    redirect_to '/discs'
  end

  def disc_params
    params.permit(:name, :plastic, :speed, :available, :producer_id)
  end
end
