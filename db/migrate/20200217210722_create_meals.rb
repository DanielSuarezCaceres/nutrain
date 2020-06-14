class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.date :day
      t.integer :kcal
      t.float :protein
      t.float :carbs
      t.float :fats
      t.boolean :vegan, default: false, null: false
      t.boolean :vegetarian, default: false, null: false
      t.boolean :gluten_free, default: false, null: false
      t.boolean :nut_free, default: false, null: false
      t.boolean :soy_free, default: false, null: false

      t.timestamps
    end
  end
end