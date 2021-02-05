# frozen_string_literal: true

class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.save
    redirect_to '/'
  end

  def show
    @diary = Diary.find(params[:id])
    @comments = @diary.comments.includes(:user)
    @comment = Comment.new
  end

  private

  def diary_params
    params.require(:diary).permit(:vegtable, :action, :image, :text, :date, :avatar).merge(user_id: current_user.id)
  end
end
