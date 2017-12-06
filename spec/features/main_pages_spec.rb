require 'rails_helper'

feature "Viewing homepage" do

  before(:each) do
    prepare_pugetive
  end

  scenario "as an anonymous browser" do
    prepare_photography

    visit '/'

    expect(page).to have_content 'Photography'
  end

end

feature "Viewing resumes" do
  scenario "downloading the public resume as a regular visitor"
  scenario "generating a new resume as admin"
end

feature "Viewing main software page" do
  before(:each) do
    prepare_pugetive
  end

  scenario "as an anonymous browser" do
    prepare_software

    visit "/software"

    expect(page).to have_content /amazon/
  end

end

feature "Viewing main music page" do
  before(:each) do
    prepare_pugetive
  end

  scenario "as an anonymous browser" do
    prepare_music

    visit "/music"

    expect(page).to have_content 'Lushy'
  end

end


feature "Viewing main photography page" do

  before(:each) do
    prepare_pugetive
  end

  scenario "as an anonymous browser" do
    prepare_photography

    visit '/photography'

    expect(page).to have_content 'Street'
    expect(page).to have_content 'Instagram'
    expect(page).to have_content 'Flickr'
  end
end


feature "Viewing main film page" do
  before(:each) do
    prepare_pugetive
  end

  scenario "as an anonymous browser" do
    prepare_film

    visit '/film'

    expect(page).to have_content 'Documentary'
  end

end


feature "visiting main writing page" do
  before(:each) do
    prepare_pugetive
  end

  scenario "as an anonymous browser" do
    prepare_writing

    visit '/writing'

    expect(page).to have_content 'Haiku'
  end

end


