class BedsController < ApplicationController
  # GET /beds
  def index
    @beds = Bed.all
  end

  def show
    @bed = Bed.where(code: params[:id]).first
    @bed_purchase = @bed.bed_purchases.build
  end
end
