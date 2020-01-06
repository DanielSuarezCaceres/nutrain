class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :lastname
      t.text :phone
      t.text :city
      t.text :country
      t.text :role

      t.timestamps
    end
  end
end
