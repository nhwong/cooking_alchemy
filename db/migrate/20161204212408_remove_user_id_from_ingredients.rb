class RemoveUserIdFromIngredients < ActiveRecord::Migration
  def change
    remove_column :ingredients, :user_id, :integer
  end
end
