class BackEnd::BedsController < BackEndController
  before_action :set_bed, only: [:show, :edit, :update, :destroy]

  # GET /beds
  def index
    @beds = Bed.all
  end

  # GET /beds/1
  def show
  end

  # GET /beds/new
  def new
    @bed = Bed.new
  end

  # GET /beds/1/edit
  def edit
  end

  # POST /beds
  def create
    @bed = Bed.new(bed_params)

    if @bed.save
      redirect_to back_end_bed_path(@bed), notice: "Veiksmīgi tika izveidota gulta '#{@bed.name}'"
    else
      render :new
    end
  end

  # PATCH/PUT /beds/1
  def update
    if @bed.update(bed_params)
      redirect_to back_end_bed_path(@bed), notice: "Veiksmīgi tika labota gulta '#{@bed.name}'"
    else
      render :edit
    end
  end

  # DELETE /beds/1
  def destroy
    @bed.destroy
    redirect_to back_end_beds_url, notice: 'Bed was successfully destroyed.'
  end

  private

  def set_bed
    @bed = Bed.find(params[:id])
  end

  def bed_params
    params.require(:bed).permit(
      :code, :name, :sequence, :has_decoration, :has_rack, :description_lv, :description_ru, :description_en, :bootsy_image_gallery_id
    )
  end
end
