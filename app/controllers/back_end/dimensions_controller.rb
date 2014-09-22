class BackEnd::DimensionsController < BackEndController
  before_action :set_itemable
  before_action :set_dimension, only: [:show, :edit, :update, :destroy]

  # GET /{:bed_id}/dimensions
  def index
    @dimensions = @itemable.dimensions
  end

  # GET /{:bed_id}/dimensions/1
  def show
  end

  # GET /{:bed_id}/dimensions/new
  def new
    @dimension = @itemable.dimensions.new
  end

  # GET /{:bed_id}/dimensions/1/edit
  def edit
  end

  # POST /{:bed_id}/dimensions
  def create
    @dimension = @itemable.dimensions.new(dimension_params)

    if @dimension.save
      redirect_to polymorphic_path([:back_end, @itemable, @dimension]), notice: 'Dimension was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /{:bed_id}/dimensions/1
  def update
    if @dimension.update(dimension_params)
      redirect_to polymorphic_path([:back_end, @itemable, @dimension]), notice: 'Dimension was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /{:bed_id}/dimensions/1.json
  def destroy
    @dimension.destroy
    redirect_to polymorphic_path([:back_end, @itemable, :dimensions]), notice: 'Dimension was successfully destroyed.'
  end

  private

  def set_dimension
    @dimension = @itemable.dimensions.find(params[:id])
  end

  def set_itemable
    @itemable = Bed.find(params[:bed_id])
  end

  def dimension_params
    params.require(:dimension).permit(:name)
  end
end
