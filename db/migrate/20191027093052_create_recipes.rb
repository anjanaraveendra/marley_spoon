class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.string :reference_number
      t.timestamps
    end
  end
end
