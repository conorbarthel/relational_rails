class Director < ApplicationRecord
  has_many :movies

  validates_presence_of :name,
                        :active,
                        :awards_won
end
