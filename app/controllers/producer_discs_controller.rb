class ProducerDiscsController < ApplicationController

  def index
    @discs = Producer.find(params[:id]).discs
  end

end
