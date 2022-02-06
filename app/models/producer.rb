class Producer < ApplicationRecord
  has_many :discs

  def count
    discs.count
  end
end
