class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @diaries = @user.diaries.order("id DESC").page(params[:page]).per(5)
  end

  def create
    user = User.find(current_user.id)
    @user = user.create(user_params)
    redirect_to '/'
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    user = User.find(current_user.id)
    @user = user.update(user_params)
    redirect_to '/'
  end

  def index
    @user = User.find(3,4)
  end

  private
  def user_params
    params.require(:user).permit(:name, :text, :icon)
  end

end
