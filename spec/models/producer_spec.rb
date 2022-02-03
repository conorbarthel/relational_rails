require 'rails_helper'

RSpec.describe Producer do
  it {should have_many :discs}
end
