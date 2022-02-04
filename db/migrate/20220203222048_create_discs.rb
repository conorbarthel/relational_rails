class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.string :name
      t.string :plastic
      t.integer :speed
      t.boolean :available
    end
  end
end
