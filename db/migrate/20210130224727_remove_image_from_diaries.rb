# frozen_string_literal: true

class RemoveImageFromDiaries < ActiveRecord::Migration[6.1]
  def change
    remove_column :diaries, :image, :string
    remove_column :diaries, :heart, :integer
  end
end
