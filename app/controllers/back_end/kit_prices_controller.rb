class BackEnd::KitPricesController < BackEndController
  before_action :set_bed, only: [:show, :edit, :update, :destroy]

  # GET /beds/1
  def show
  end

  # GET /beds/1/edit
  def edit
  end

  # PATCH/PUT /beds/1
  def update
    if @bed.update(bed_params)
      redirect_to back_end_bed_kit_prices_path(@bed), notice: "Veiksmīgi tika labotas gultas '#{@bed.name}' komplektu cenas"
    else
      render :edit
    end
  end

  private

  def set_bed
    @bed = Bed.find(params[:bed_id])
  end

  def bed_params
    params.require(:bed).permit(kit_prices_attributes: [
      :id, :dimension_id, :kit_id, :price
    ])
  end
end
