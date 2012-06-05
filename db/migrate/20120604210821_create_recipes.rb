class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :description
      t.string :ingredients
      t.string :directions
      t.string :prep_time
      t.string :cooking_time
      t.integer :user_id

      t.timestamps
    end
    add_index :recipes, [:user_id, :created_at]
  end

  def self.down
    drop_table :recipes
  end
end
