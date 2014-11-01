class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:edit, :update, :show]
  before_action :set_itemable

  # GET /purchases/[:id]
  def show
  end

  # GET /purchases/[:id]/edit
  def edit
  end

  # POST /beds/{:itemable_id}/purchases
  def create
    @purchase = @itemable.purchases.new(purchase_params.merge(ip_address: request.remote_ip, state: 'created'))
    set_itemable_price(@purchase)

    if @purchase.save
      redirect_to edit_purchase_path(@purchase.uid)
    else
      redirect_to friendly_itemable_path(@itemable), alert: 'Can not create purchase'
    end
  end

  # PATCH/PUT /purchases/:id
  def update
    if @purchase.update(purchase_params.merge(state: 'completed'))
      redirect_to purchase_path(@purchase.uid)
    else
      redirect_to friendly_itemable_path(@itemable), alert: 'Can not update purchase'
    end
  end

  private

  def set_itemable
    if params[:id]
      @itemable = @purchase.itemable
    elsif params[:bed_id]
      @itemable = Bed.find(params[:bed_id])
    else
      @itemable = Linen.find(params[:linen_id])
    end
  end

  def set_purchase
    @purchase = Purchase.where(uid: params[:id]).first
  end

  def set_itemable_price(purchase)
    klass = @itemable.is_a?(Bed) ? BedPrice : LinenPrice
    purchase.itemable_price = klass.find(params[:price_id])
  end

  def purchase_params
    params.require(:purchase).permit(
      :color_id, :kit_price_id, :name, :email, :phone, :notes, :address, :zip_code, :city, :country
    )
  end

  def set_active_nav_tab
    @active_nav_tab = :beds
  end
end
