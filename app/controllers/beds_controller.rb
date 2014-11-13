class BedsController < ApplicationController
  # GET /beds
  def index
    @beds = Bed.all.order('sequence ASC')
  end

  def show
    @bed = Bed.where(code: params[:id]).first
    @purchase = @bed.purchases.build
    render :show
  end

  def set_active_nav_tab
    @active_nav_tab = :beds
  end
end
