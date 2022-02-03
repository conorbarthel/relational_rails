require 'rails_helper'

RSpec.describe Director do
  it {should have_many :movies}
end
