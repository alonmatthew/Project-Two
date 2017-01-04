class UpvotesController < ApplicationController
  def create
    @image = Image.find(params[:id])
    if Upvote.create(user: current_user.id, image: @image)
      redirect_to image_path
    end
  end
end
