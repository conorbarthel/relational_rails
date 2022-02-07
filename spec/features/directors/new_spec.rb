require 'rails_helper'

RSpec.describe 'director new page', type: :feature do
  describe 'User Story 11' do
    it 'displays link "Add Director" to /director/new' do
      visit "/directors"
      click_on "Add Director"
      expect(current_path).to eq("/directors/new")
    end

    it 'has form for director creation' do
      visit "/directors/new"

      expect(page).to have_field(:name)
      expect(page).to have_field(:awards_won)
      expect(page).to have_field(:active)
    end

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
end
