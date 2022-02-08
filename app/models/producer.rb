class Producer < ApplicationRecord
  has_many :discs, dependent: :destroy
  validates_presence_of :name,
                        :number_of_athletes
  validates :free_shipping, inclusion: [true, false]

  def count
    discs.count
  end

  def sort_alpha
    discs.order(:name)
  end

  def speed_over(number)
    self.discs.where("speed > #{number}")
  end
end
