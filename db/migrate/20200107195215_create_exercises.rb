class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :description
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.string :file

      t.timestamps
    end
  end
end
