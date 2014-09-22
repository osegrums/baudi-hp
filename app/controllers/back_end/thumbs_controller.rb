class BackEnd::ThumbsController < BackEndController
  before_action :load_thumbable
  before_action :load_thumb, only: [:show, :destroy]

  # GET /thumbs
  def index
    @thumbs = @thumbable.thumbs.all
  end

  # GET /thumbs/1
  def show
    @thumb = @thumbable.thumbs.find(params[:id])
  end

  # GET /thumbs/new
  def new
    @thumb = @thumbable.thumbs.new
  end

  # GET /thumbs/1/edit
  def edit
    @thumb = @thumbable.thumbs.find(params[:id])
  end

  # POST /thumbs
  def create
    @thumb = @thumbable.thumbs.new(thumb_params)

    if @thumb.save
      redirect_to polymorphic_path([:back_end, @itemable, @thumbable, @thumb]), notice: 'Photo was successfully created'
    else
      render :new
    end
  end

  # PUT /thumbs/1
  def update
    @thumb = @thumbable.thumbs.find(params[:id])

    if @thumb.update_attributes(thumb_params)
      redirect_to polymorphic_path([:back_end, @itemable, @thumbable, @thumb]), notice: 'Photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /thumbs/1
  def destroy
    @thumb = @thumbable.thumbs.find(params[:id])
    @thumb.destroy

    redirect_to polymorphic_path([:back_end, @itemable, @thumbable, :thumbs])
  end

  private

  def load_thumb
    @thumb = @thumbable.thumbs.find(params[:id])
  end

  def load_thumbable
    @thumbable = Kit.find(params[:kit_id])
    @itemable = @thumbable.itemable
  end

  def thumb_params
    params.require(:thumb).permit(:file, :description)
  end
end
