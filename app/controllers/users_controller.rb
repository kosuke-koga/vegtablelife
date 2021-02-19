# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :move_to_index
  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries.order('id DESC').page(params[:page]).per(5)
    @cards = Task.includes(:user).where(user_id: @user)
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
    redirect_back fallback_location: '/'
  end

  def index
    @user = User.find(3, 4)
  end

  private

  def user_params
    params.require(:user).permit(:name, :text, :icon)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
