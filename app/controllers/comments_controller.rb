# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @diary = Diary.find(params[:diary_id])
    @comment = comment.new
  end

  def create
    @diary = Diary.find(params[:diary_id])
    @comment = @diary.comments.build(comment_params)
    @comment.save
    redirect_back fallback_location: @diary_url
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end
end
