require 'rails_helper'

RSpec.describe Director do
  describe 'relationships' do
    it {should have_many :movies}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should allow_value(true).for(:active)}
    it {should allow_value(false).for(:active)}
    it {should validate_presence_of :awards_won}
  end
end
