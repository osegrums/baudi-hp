class LinensController < ApplicationController
  # GET /linens
  def index
    @linens = Linen.all.order('sequence ASC')
  end

  def show
    @linen = Linen.where(code: params[:id]).first
    @purchase = @linen.purchases.build
    render :show
  end

  def set_active_nav_tab
    @active_nav_tab = :linens
  end
end
