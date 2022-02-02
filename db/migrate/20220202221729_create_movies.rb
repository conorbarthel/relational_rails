class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.boolean :released
      t.integer :length
      t.string :genre

      t.timestamps
    end
  end
end
