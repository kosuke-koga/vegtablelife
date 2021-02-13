# frozen_string_literal: true

class CreateInfomations < ActiveRecord::Migration[6.1]
  def change
    create_table :infomations do |t|
      t.string :title
      t.text :info
      t.timestamps
    end
  end
end
