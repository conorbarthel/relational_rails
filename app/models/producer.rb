class Producer < ApplicationRecord
  has_many :discs
  validates_presence_of :name,
                        :number_of_athletes
  validates :free_shipping, inclusion: [true, false]

  def count
    discs.count
  end
end
