class Disc < ApplicationRecord
  belongs_to :producer
  validates_presence_of :name,
                        :speed,
                        :plastic
  validates :available, inclusion: [true, false]

end
