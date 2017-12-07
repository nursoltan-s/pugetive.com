require 'rails_helper'

feature 'Sign in', :devise do

  scenario 'with admin credentials' do
    user = FactoryBot.create(:user)
    sign_in(user.email, user.password)

    visit "/"

    expect(page).to have_content 'Status'
  end

  scenario 'with incorrect email' do
    user = FactoryBot.create(:user)
    sign_in('invalid@example.com', user.password)

    visit "/"

    expect(page).to have_content "Invalid"
  end

  scenario 'with incorrect password' do
    user = FactoryBot.create(:user)
    sign_in(user.email, 'invalidpass')

    visit "/"

    expect(page).to have_content "Invalid"
  end

end