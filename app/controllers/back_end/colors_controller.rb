class BackEnd::ColorsController < BackEndController
  before_action :set_itemable
  before_action :set_color, only: [:show, :edit, :update, :destroy]

  # GET /{:bed_id}/colors
  def index
    @colors = @itemable.colors.order(sequence: :asc)
  end

  # GET /{:bed_id}/colors/1
  def show
  end

  # GET /{:bed_id}/colors/new
  def new
    @color = @itemable.colors.new
  end

  # GET /{:bed_id}/colors/1/edit
  def edit
  end

  # POST /{:bed_id}/colors
  def create
    @color = @itemable.colors.new(color_params)

    if @color.save
      redirect_to polymorphic_path([:back_end, @itemable, @color]), notice: 'Color was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /{:bed_id}/colors/1
  def update
    if @color.update(color_params)
      redirect_to polymorphic_path([:back_end, @itemable, @color]), notice: 'Color was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /{:bed_id}/colors/1
  def destroy
    @color.destroy
    redirect_to polymorphic_path([:back_end, @itemable, :colors]), notice: 'Color was successfully destroyed.'
  end

  private

  def set_color
    @color = @itemable.colors.find(params[:id])
  end

  def set_itemable
    @itemable = Bed.find(params[:bed_id])
  end

  def color_params
    params.require(:color).permit(:name_lv, :name_en, :name_ru)
  end
end
