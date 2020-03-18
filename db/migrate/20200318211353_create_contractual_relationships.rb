class CreateContractualRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :contractual_relationships do |t|
      t.references :client, index: true, foreign_key: { to_table: 'users' }
      t.references :professional, index: true, foreign_key: { to_table: 'users' }
      t.string :state

      t.timestamps
    end
  end
end
