class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.integer :user_id
      t.integer :result_id
      t.string :ingredient

      t.timestamps null: false
    end
  end
end
