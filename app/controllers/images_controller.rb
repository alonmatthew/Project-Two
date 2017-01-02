class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if @image.save
      redirect_to images_path
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @comment = @image.comments.new
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
  end

  def destroy
    @image = Image.find(params[:id])
    @image.comments.destroy
    @image.destroy
    redirect_to root_path
  end

  def show_category
    @images = Image.find_by_category(params[:category.name])
  end

  def comment
    @image = Image.find(params[:id])
    Comment.create({image: @image, content: params[:comment][:content], user: current_user})
    redirect_to image_path(@image)
  end

  private
    def image_params
    return params.require(:image).permit(:img_url, :img_caption, :category)
    end

    def comment_params
      return params.require(:content)
    end
end
