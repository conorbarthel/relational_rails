class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :name
      t.boolean :active
      t.integer :awards_won

      t.timestamps
    end
  end
end
