class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.date :day
      t.string :goal

      t.timestamps
    end
  end
end
