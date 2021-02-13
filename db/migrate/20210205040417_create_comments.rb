# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :diary, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
