class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.references :client, index: true, foreign_key: { to_table: 'users' }
      t.references :professional, index: true, foreign_key: { to_table: 'users' }
      t.datetime :scheduled_at

      t.timestamps
    end
  end
end
