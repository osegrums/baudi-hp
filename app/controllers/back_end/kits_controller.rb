class BackEnd::KitsController < BackEndController
  before_action :set_itemable
  before_action :set_kit, only: [:show, :edit, :update, :destroy]

  # GET /{:bed_id}/kits
  def index
    @kits = @itemable.kits
  end

  # GET /{:bed_id}/kits/1
  def show
  end

  # GET /{:bed_id}/kits/new
  def new
    @kit = @itemable.kits.new
  end

  # GET /{:bed_id}/kits/1/edit
  def edit
  end

  # POST /{:bed_id}/kits
  def create
    @kit = @itemable.kits.new(kit_params)

    if @kit.save
      redirect_to polymorphic_path([:back_end, @itemable, @kit]), notice: 'Kit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /{:bed_id}/kits/1
  def update
    if @kit.update(kit_params)
      redirect_to polymorphic_path([:back_end, @itemable, @kit]), notice: 'Kit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /{:bed_id}/kits/1
  def destroy
    @kit.destroy
    redirect_to polymorphic_path([:back_end, @itemable, :kits]), notice: 'Kit was successfully destroyed.'
  end

  private

  def set_kit
    @kit = @itemable.kits.find(params[:id])
  end

  def set_itemable
    @itemable = Bed.find(params[:bed_id])
  end

  def kit_params
    params.require(:kit).permit(:name_lv, :name_en, :name_ru)
  end
end
