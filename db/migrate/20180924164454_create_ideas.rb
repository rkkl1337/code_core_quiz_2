# frozen_string_literal: true

class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :body
      t.integer :members
      t.integer :likes

      t.timestamps
    end
  end
end
