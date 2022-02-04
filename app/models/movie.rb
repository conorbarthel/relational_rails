class Movie < ApplicationRecord
  belongs_to :director
  validates_presence_of :title,
                        :length,
                        :genre
  validates :recently_viewed, inclusion: [true, false]
end
