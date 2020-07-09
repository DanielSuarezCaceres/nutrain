class CreatePhysioExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :physio_exercises do |t|
      t.string :name
      t.text :description
      t.bigint :user_id
      # t.references :client, index: true, foreign_key: { to_table: 'users' }
      t.string :duration
      #t.references :sent_by, index: true, foreign_key: { to_table: 'users' }

      t.timestamps
      t.index ["user_id"], name: "index_psychology_tasks_on_user_id"
    end
  end
end
