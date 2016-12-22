class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
    else
      render :new
    end
  end

  def shows
  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

private
  def user_params
  return params.require(:user).permit(:username, :email, :password, :bio, :password_confirmation, :profile_img)
  end
end
