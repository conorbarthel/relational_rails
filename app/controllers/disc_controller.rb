class DiscController < ApplicationController
  def index
    @discs = Disc.all
  end
end
