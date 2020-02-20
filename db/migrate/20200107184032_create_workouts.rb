class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.date :date
      t.bigint :user_id

      t.timestamps
      t.index ["user_id"], name: "index_workouts_on_user_id"
    end
  end
end
