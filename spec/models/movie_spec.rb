require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :director}
  end

  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :length}
    it {should validate_presence_of :genre}
    it {should allow_value(true).for(:recently_viewed)}
    it {should allow_value(false).for(:recently_viewed)}
  end
end
