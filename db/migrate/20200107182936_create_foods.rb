class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :kcal
      t.integer :protein
      t.integer :ch
      t.integer :fats

      t.timestamps
    end
  end
end
