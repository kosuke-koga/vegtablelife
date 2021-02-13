class BookmarkController < ApplicationController
  def create
    if @diary.user_id != current_user.id 
      @bookmark = Bookmark.create(user_id: current_user.id, diary_id: @diary.id)
    end
  end
 
  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id, diray_id: @diary.id)
    @bookmark.destroy
  end

  private
  def set_diary
    @diary = Diary.find(params[:diary_id])
  end 
end
