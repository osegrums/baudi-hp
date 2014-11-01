class BedsController < ApplicationController
  # GET /beds
  def index
    @beds = Bed.all.order('sequence ASC')
  end

  def show
    @bed = Bed.where(code: params[:id]).first
    @purchase = @bed.purchases.build
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
