class ProducerDiscsController < ApplicationController

  def index
    @producer = Producer.find(params[:id])
    if params[:sort] == 'alpha'
      @discs = @producer.sort_alpha
    elsif params[:filter]
      @discs = @producer.speed_over(params[:filter])
    else
      @discs = @producer.discs
    end
  end

  def new
  end

  def create
    new_disc = Disc.create(disc_params)
    redirect_to '/discs'
  end

  private
    def disc_params
      params.permit(:name, :plastic, :speed, :available, :producer_id)
    end
end
