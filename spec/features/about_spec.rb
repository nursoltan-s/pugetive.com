require 'rails_helper'

feature "Arriving at Public site" do
  # background do
  #   User.make(email: 'user@example.com', password: 'caplin')
  # end

  scenario "visiting homepage" do
    visit '/'
    expect(page).to have_content 'Photography'
  end


  scenario "visiting interest pages" do
    visit "/software"
    expect(page).to have_content 'Amazon'

    visit "/music"
    expect(page).to have_content 'Lushy'

    visit '/photography'
    expect(page).to have_content 'Street'

    visit '/film'
    expect(page).to have_content 'Documentary'

    visit '/writing'
    expect(page).to have_content 'Amazon'

  end

end


