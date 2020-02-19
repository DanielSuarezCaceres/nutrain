class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.string :file
      t.integer :kcal
      t.bigint :user_id
      t.boolean :vegan, default: false, null: false
      t.boolean :vegetarian, default: false, null: false
      t.boolean :gluten_free, default: false, null: false
      t.boolean :nut_free, default: false, null: false
      t.boolean :soy_free, default: false, null: false

      t.timestamps
      t.index ["user_id"], name: "index_meals_on_user_id"
    end
  end
end
