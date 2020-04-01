class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :client, index: true, foreign_key: { to_table: 'users' }
      t.references :professional, index: true, foreign_key: { to_table: 'users' }
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
