class Director < ApplicationRecord
  has_many :movies

  validates_presence_of :name,
                        :awards_won
end
