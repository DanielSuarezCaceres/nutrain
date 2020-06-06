class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.string :brand
      t.integer :kcal
      t.float :protein
      t.float :carbs
      t.float :fats
      t.float :serving_size
      t.boolean :vegan, default: false, null: false
      t.boolean :vegetarian, default: false, null: false
      t.boolean :gluten_free, default: false, null: false
      t.boolean :nut_free, default: false, null: false
      t.boolean :soy_free, default: false, null: false

      t.timestamps
    end
  end
end
