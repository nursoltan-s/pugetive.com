require 'rails_helper'

feature "Viewing Title pages" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_software
    setup_music

    titles = Title.random(3)

    expect(titles.size).to eq 3
    titles.each do |title|
      visit title_path(title)

      expect(page).to have_content title.name
    end
  end

end
