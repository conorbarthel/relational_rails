class CreateProducers < ActiveRecord::Migration[5.2]
  def change
    create_table :producers do |t|
      t.string :name
      t.integer :number_of_athletes
      t.boolean :free_shipping

      t.timestamps
    end
  end
end
