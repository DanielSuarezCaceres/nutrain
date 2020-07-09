class CreatePsychologyTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :psychology_tasks do |t|
      t.string :name
      t.text :description
      t.string :goal
      t.bigint :user_id
      # t.references :client, index: true, foreign_key: { to_table: 'users' }
      #t.references :sent_by, index: true, foreign_key: { to_table: 'users' }
      
      t.timestamps
      t.index ["user_id"], name: "index_physio_exercises_on_user_id"
    end
  end
end
