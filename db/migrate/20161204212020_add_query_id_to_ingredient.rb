class AddQueryIdToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :query_id, :integer
  end
end
