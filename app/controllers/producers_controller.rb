class ProducersController < ApplicationController

  def index
    @producers = Producer.all.order("created_at desc")
  end

  def show
    @producer = Producer.find(params[:id])
  end
end
