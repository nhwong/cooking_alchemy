class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.integer :recipe_id
      t.string :ingredient

      t.timestamps null: false
    end
  end
end
