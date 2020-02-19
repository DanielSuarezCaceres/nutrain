class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :gender
      t.string :phone
      t.string :city
      t.string :country
      t.string :role

      t.timestamps
    end
  end
end
