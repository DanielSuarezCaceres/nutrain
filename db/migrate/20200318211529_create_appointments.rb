class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :client, index: true, foreign_key: { to_table: 'users' }
      t.references :professional, index: true, foreign_key: { to_table: 'users' }
      t.string :description
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
