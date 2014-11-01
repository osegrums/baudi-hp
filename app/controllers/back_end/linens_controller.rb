class BackEnd::LinensController < BackEndController
  before_action :set_linen, only: [:show, :edit, :update, :destroy]

  # GET /back_end/linens
  def index
    @linens = Linen.all.order(sequence: :asc)
  end

  # GET /back_end/linens/1
  def show
  end

  # GET /back_end/linens/new
  def new
    @linen = Linen.new
  end

  # GET /back_end/linens/1/edit
  def edit
  end

  # POST /back_end/linens
  def create
    @linen = Linen.new(linen_params)

    if @linen.save
      redirect_to back_end_linen_path(@linen), notice: "Veiksmīgi tika izveidots komplekts '#{@linen.name}'"
    else
      render :new
    end
  end

  # PATCH/PUT /back_end/linens/1
  def update
    if @linen.update(linen_params)
      redirect_to back_end_linen_path(@linen), notice: "Veiksmīgi tika labots komplekts '#{@linen.name}'"
    else
      render :edit
    end
  end

  # DELETE /back_end/linens/1
  def destroy
    @linen.destroy
    redirect_to back_end_linens_url, notice: 'LInen was successfully destroyed.'
  end

  private

  def set_linen
    @linen = Linen.find(params[:id])
  end

  def linen_params
    params.require(:linen).permit(
      :code, :name, :sequence, :description_lv, :description_ru, :description_en
    )
  end
end
