class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.references :client, index: true , foreign_key: { to_table: 'users', on_delete: :cascade }
      t.references :professional, index: true, foreign_key: { to_table: 'users', on_delete: :cascade }
      t.string :state
      t.string :message
      t.references :sent_by, index: true, foreign_key: { to_table: 'users', on_delete: :cascade }

      t.timestamps
    end
  end
end
