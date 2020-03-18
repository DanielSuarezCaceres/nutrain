class CreateDiets < ActiveRecord::Migration[6.0]
  def change
    create_table :diets do |t|
      t.string :name
      t.text :description
      t.integer :kcal_goal
      t.integer :total_meals
      t.bigint :user_id
      t.string :goal
      t.boolean :active

      t.timestamps
      t.index ["user_id"], name: "index_diets_on_user_id"
    end
  end
end
