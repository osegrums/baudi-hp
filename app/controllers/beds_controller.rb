class BedsController < ApplicationController
  # GET /beds
  def index
    @beds = Bed.all
  end

  def show
    @bed = Bed.where(code: params[:id]).first
  end
end
