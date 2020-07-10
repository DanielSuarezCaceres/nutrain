class CreatePhysioExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :physio_exercises do |t|
      t.string :name
      t.text :description
      #t.bigint :user_id
      t.references :user, index: true, foreign_key: true, on_delete: :cascade
      t.string :duration

      t.timestamps
      #t.index ["user_id"], name: "index_psychology_tasks_on_user_id"
    end
  end
end
