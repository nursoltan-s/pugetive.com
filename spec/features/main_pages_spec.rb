require 'rails_helper'

feature "Viewing homepage" do

  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_photography

    visit '/'

    expect(page).to have_content 'Photography'
  end

end

feature "Viewing main software page" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_software

    visit "/software"

    expect(page).to have_content /amazon/
  end

end

feature "Viewing main music page" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_music

    visit "/music"

    expect(page).to have_content 'Lushy'
  end

end


feature "Viewing main photography page" do

  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_photography

    visit '/photography'

    expect(page).to have_content 'Street'
    expect(page).to have_content 'Instagram'
    expect(page).to have_content 'Flickr'
  end
end


feature "Viewing main film page" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_film

    visit '/film'

    expect(page).to have_content 'Documentary'
  end

end


feature "visiting main writing page" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_writing

    visit '/writing'

    expect(page).to have_content 'Haiku'
  end

end


feature "Sign in pipeline" do
  before(:each) do
    setup_pugetive
  end

  scenario "as the admin user signing in" do
    create(:user)

    visit new_user_session_path
    fill_in 'user[email]', :with => 'test@pugetive.com'
    fill_in 'user[password]', :with => 'testymctesterson'
    find('input[name="commit"]').click

    expect(page).to have_content "Signed in successfully"
  end
end