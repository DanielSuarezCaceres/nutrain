class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.bigint :user_id
      t.integer :number_of_exercises

      t.timestamps
      t.index ["user_id"], name: "index_workouts_on_user_id"
    end
  end
end
