class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.string :name
      t.text :description
      t.integer :total_kcal
      t.integer :total_meals
      t.bigint :user_id
      t.string :goal

      t.timestamps
      t.index ["user_id"], name: "index_diets_on_user_id"
    end
  end
end