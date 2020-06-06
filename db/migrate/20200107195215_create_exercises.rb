class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      # t.references :user, index: true, foreign_key: true
      t.text :description
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.references :workout, foreign_key: true

      t.timestamps
    end
  end
end
