class ProducersController < ApplicationController

  def index
    @producers = Producer.all.order("created_at desc")
  end

  def show
    @producer = Producer.find(params[:id])
  end

  def new
  end

  def create
    new_producer = Producer.create(producer_params)
    redirect_to '/producers'
  end

  def producer_params
    params.permit(:name, :number_of_athletes, :free_shipping)
  end
end
