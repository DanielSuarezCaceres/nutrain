class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.datetime :day
      t.float :weight
      t.integer :body_fat
      t.integer :neck_size
      t.integer :chest_size
      t.integer :arm_size
      t.integer :waist_size
      t.integer :hips_size
      t.integer :leg_size
      t.references :user, index: true, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
