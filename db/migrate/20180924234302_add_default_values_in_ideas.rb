class AddDefaultValuesInIdeas < ActiveRecord::Migration[5.2]
  def change
    change_column :ideas, :members, :integer, :default => 0
    change_column :ideas, :likes, :integer, :default => 0
  end
end
