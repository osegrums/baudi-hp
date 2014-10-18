class BedPurchasesController < ApplicationController
  before_action :set_bed
  before_action :set_bed_purchase, only: [:edit, :update, :show]

  # GET /beds/{:bed_id}/bed_purchases/[:id]
  def show
  end

  # GET /beds/{:bed_id}/bed_purchases/[:id]/edit
  def edit
  end

  # POST /beds/{:bed_id}/bed_purchases
  def create
    @bed_purchase = @bed.bed_purchases.new(bed_purchase_params.merge(ip_address: request.remote_ip, state: 'created'))

    if @bed_purchase.save
      redirect_to edit_bed_bed_purchase_path(@bed, @bed_purchase.uid)
    else
      redirect_to friendly_bed_path(@bed), alert: 'Can not create purchase'
    end
  end

  # PATCH/PUT /beds/{:bed_id}/bed_purchases/1
  def update
    if @bed_purchase.update(bed_purchase_params.merge(state: 'completed'))
      redirect_to bed_bed_purchase_path(@bed, @bed_purchase.uid)
    else
      redirect_to friendly_bed_path(@bed), alert: 'Can not update purchase'
    end
  end

  private

  def set_bed
    @bed = Bed.find(params[:bed_id])
  end

  def set_bed_purchase
    @bed_purchase = BedPurchase.where(uid: params[:id]).first
  end

  def bed_purchase_params
    params.require(:bed_purchase).permit(
      :color_id, :bed_id, :bed_price_id, :kit_price_id, :name, :email, :phone, :notes, :address, :zip_code, :city, :country
    )
  end

  def set_active_nav_tab
    @active_nav_tab = :beds
  end
end
