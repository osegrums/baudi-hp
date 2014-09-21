class BedsController < ApplicationController
  # GET /beds
  def index
    @beds = Bed.all
  end

  def show
    @bed = Bed.find(params[:id])
  end
end
