class CreateRecipeChefs < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_chefs do |t|
      t.references :recipe, foreign_key: true
      t.references :chef, foreign_key: true

      t.timestamps
    end
  end
end
