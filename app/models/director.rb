class Director < ApplicationRecord
  has_many :movies
  validates_presence_of :name,
                        :awards_won
  validates :active, inclusion: [true, false]

  def total_movies
    movies.count
  end
end
