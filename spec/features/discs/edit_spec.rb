RSpec.describe 'edit' do

  before(:each) do
    @innova = Producer.create!(name:'Innova', number_of_athletes: 56, free_shipping: true)
    @discraft = Producer.create!(name:'Discraft', number_of_athletes: 65, free_shipping: true)
    @zone = @discraft.discs.create!(name: 'Zone', plastic: 'Glow', speed: 4, available: true)
    @leopard = @innova.discs.create!(name: 'Leopard', plastic: 'DX', speed: 6, available: true)
  end

  it "the form is filled out information is updated" do
    visit "/discs/#{@leopard.id}/edit"
    fill_in("Name", with:"Leopard3")
    fill_in("Plastic", with:"Halo")
    fill_in("Speed", with:7)
    fill_in("Producer id", with:"#{@innova.id}")
    check("available")
    click_button("Update Disc")
    save_and_open_page

    expect(current_path).to eq("/discs/#{@leopard.id}")
    expect(page).to have_content("Leopard3")
    expect(page).to have_content("Halo")
    expect(page).to have_content(7)
    expect(page).to have_content("true")
  end
end
