# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :move_to_index
  def create
    diary = Diary.find(params[:diary_id])
    current_user.bookmark(diary)
    redirect_back fallback_location: root_path, success: 'ブックマークしました'
  end

  def destroy
    diary = current_user.bookmarks.find(params[:id]).diary
    current_user.unbookmark(diary)
    redirect_back fallback_location: root_path, success: 'ブックマークを外しました'
  end

  private

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
