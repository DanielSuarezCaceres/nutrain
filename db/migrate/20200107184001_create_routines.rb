class CreateRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :routines do |t|
      t.string :name
      t.text :description
      t.bigint :user_id
      t.string :file
      t.integer :days_of_exercise
      t.string :goal

      t.timestamps
      t.index ["user_id"], name: "index_routines_on_user_id"
    end
  end
end