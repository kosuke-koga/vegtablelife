# frozen_string_literal: true

class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.integer :user_id
      t.string :vegtable
      t.string :action
      t.string :image
      t.text :text
      t.integer :heart
      t.date :date
      t.timestamps
    end
  end
end
