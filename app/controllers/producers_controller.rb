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

  def edit
    @producer = Producer.find(params[:id])
  end

  def update
    producer = Producer.find(params[:id])
    producer.update(producer_params)
    redirect_to "/producers/#{producer.id}"
  end

  def destroy
    Producer.destroy(params[:id])
    redirect_to "/producers"
  end

  private
    def producer_params
      params.permit(:name, :number_of_athletes, :free_shipping)
    end
end
