require 'rails_helper'

RSpec.describe Disc do
  describe 'relationships' do
    it {should belong_to :producer}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :speed}
    it {should validate_presence_of :plastic}
    it {should allow_value(true).for(:available)}
    it {should allow_value(false).for(:available)}
  end
end
