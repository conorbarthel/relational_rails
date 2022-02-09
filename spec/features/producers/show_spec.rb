require 'rails_helper'

RSpec.describe 'the producer index page' do
  before(:each) do
    @innova = Producer.create(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create(name:'Discraft', number_of_athletes: 65, free_shipping: true)
  end

  it 'displays the details of one producers' do
    visit "/producers/#{@innova.id}"

    expect(page).to have_content(@innova.number_of_athletes)
    expect(page).to have_content(@innova.free_shipping)
    expect(page).to_not have_content(@discraft.name)
  end

  it "shows a count of number of discs for one producer" do
    visit "/producers/#{@innova.id}"

    expect(page).to have_content(@innova.count)
  end

  it 'has a link to all of one producers discs' do
    visit "/producers/#{@innova.id}"

    click_on "#{@innova.name} discs"
    expect(current_path).to eq("/producers/#{@innova.id}/discs")
  end

  it "has a link to edit the producer" do
    visit "/producers/#{@innova.id}"

    click_on "Update #{@innova.name}"
    expect(current_path).to eq("/producers/#{@innova.id}/edit")
  end
end
