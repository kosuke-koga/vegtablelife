# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.text :list
      t.text :card
      t.date :date
      t.timestamps
    end
  end
end
