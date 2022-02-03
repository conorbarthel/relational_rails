require 'rails_helper'

RSpec.describe Director do
  describe 'relationships' do
    it {should have_many :movies}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :active}
    it {should validate_presence_of :awards_won}
  end
end
