require 'rails_helper'

feature "Arriving at Public site" do
  # background do
  #   User.make(email: 'user@example.com', password: 'caplin')
  # end

  scenario "visiting homepage" do
    visit '/'
    expect(page).to have_content 'Photography'
  end


  scenario "visiting software page" do
    visit "/software"
    expect(page).to have_content 'Amazon'
  end

  scenario "visiting music page" do
    visit "/music"
    expect(page).to have_content 'Lushy'
  end

  scenario "visiting photography page" do
    visit '/photography'
    expect(page).to have_content 'Street'
  end

  scenario "visiting documentary page" do
    visit '/film'
    expect(page).to have_content 'Documentary'
  end

  scenario "visiting writing page" do
    visit '/writing'
    expect(page).to have_content 'Haiku'

  end

end


