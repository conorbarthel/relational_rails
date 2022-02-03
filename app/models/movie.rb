class Movie < ApplicationRecord
  belongs_to :director

  validates_presence_of :title,
                        :length,
                        :genre
end
