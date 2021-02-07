# frozen_string_literal: true

class DiariesController < ApplicationController
  def index
    @search_params = diary_search_params
    @diaries = Diary.all.order("id DESC").page(params[:page]).per(5).search(@search_params)
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

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    diary = Diary.find(params[:id])
    diary.update(diary_params)
    redirect_to "/"
  end

  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to "/"
  end

  def atunou_index
    @atunou_diaries = Diary.where(user_id: 3).or(Diary.where(user_id: 4)).order("id DESC").page(params[:page]).per(5)
  end

  private

  def diary_search_params
    params.fetch(:search, {}).permit(:vegtable)
  end

  def diary_params
    params.require(:diary).permit(:vegtable, :action, :image, :text, :date, :avatar).merge(user_id: current_user.id)
  end
end
