class BedsController < ApplicationController
  # GET /beds
  def index
    @beds = Bed.all
  end

  def show
    @bed = Bed.where(code: params[:id]).first
    @bed_purchase = @bed.bed_purchases.build
    if params[:showme]
      render :show
    else
      render :show_incomplete
    end
  end

  def set_active_nav_tab
    @active_nav_tab = :beds
  end
end
