class AddProducerToDisc < ActiveRecord::Migration[5.2]
  def change
    add_reference :discs, :producer, foreign_key: true
  end
end
