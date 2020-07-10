class CreatePsychologyTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :psychology_tasks do |t|
      t.string :name
      t.text :description
      t.string :goal
      #t.bigint :user_id
      t.references :user, index: true, foreign_key: true, on_delete: :cascade
      
      t.timestamps
      #t.index ["user_id"], name: "index_physio_exercises_on_user_id"
    end
  end
end
