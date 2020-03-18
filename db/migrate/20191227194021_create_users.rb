class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :gender
      t.string :age
      t.string :height
      t.string :weight
      t.string :phone
      t.string :city
      t.string :country
      t.string :description
      t.string :type
      t.boolean :nutritionist
      t.boolean :trainer
      t.boolean :physiotherapist
      t.boolean :psychologist
      t.boolean :verified

      t.timestamps
    end
  end
end
