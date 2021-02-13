# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :diary_params

  def create
    Like.create(user_id: current_user.id, diary_id: params[:id])
    redirect_to '/'
  end

  def destroy
    Like.find_by(user_id: current_user.id, diary_id: params[:id]).destroy
    redirect_to '/'
  end

  private

  def diary_params
    @diary = Diary.find(params[:id])
  end
end
