require 'rails_helper'

RSpec.describe 'director new page', type: :feature do
  # User Story 11, Parent Creation (x2)
  # ...After I am taken to '/parents/new'
  # I  see a form for a new parent record
  it 'has form for director creation' do
    visit "/directors/new"

    expect(page).to have_field(:name)
    expect(page).to have_field(:awards_won)
    expect(page).to have_field(:active)
  end

  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  it 'can create a new director' do
    visit "/directors/new"

    fill_in(:name, with: 'David Lynch')
    fill_in(:awards_won, with: 9)
    check('Active')

    click_button "Create Director"

    expect(current_path).to eq("/directors")
    expect(page).to have_content("David Lynch")
  end
end
