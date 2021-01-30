class RemoveUserIdFromDiaries < ActiveRecord::Migration[6.1]
  def change
    remove_column :diaries, :user_id, :integer
  end
end
