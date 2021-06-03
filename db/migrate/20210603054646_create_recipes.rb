class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :difficulty_level
      t.boolean :variant
      t.string :text
      t.string :title
      t.integer :calories
      t.integer :carbs
      t.integer :protein

      t.timestamps
    end
  end
end
