class Movie < ApplicationRecord
  belongs_to :director
  validates_presence_of :title,
                        :length,
                        :genre
  validates             :recently_viewed, inclusion: [true, false]


  def self.recently_viewed?
    where(recently_viewed: true)
  end

  def self.above_length(length)
    where("Length > #{length}")
  end

  def self.alphabetize
    order(:title)
  end
end
