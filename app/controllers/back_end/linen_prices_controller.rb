class BackEnd::LinenPricesController < BackEndController
  before_action :set_linen, only: [:show, :edit, :update, :destroy]

  # GET /back_end/linens/1
  def show
  end

  # GET /back_end/linens/1/edit
  def edit
  end

  # PATCH/PUT /back_end/linens/1
  def update
    if @linen.update(linen_params)
      redirect_to back_end_linen_prices_path(@linen), notice: "Veiksmīgi tika labotas gultas '#{@linen.name}' komplektu cenas"
    else
      render :edit
    end
  end

  private

  def set_linen
    @linen = Linen.find(params[:linen_id])
  end

  def linen_params
    params.require(:linen).permit(linen_prices_attributes: [
      :id, :dimension_id, :kit_id, :price
    ])
  end
end
