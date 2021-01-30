# frozen_string_literal: true

class AddAvatarToDiaries < ActiveRecord::Migration[6.1]
  def change
    add_column :diaries, :avatar, :string
  end
end
