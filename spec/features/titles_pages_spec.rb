require 'rails_helper'

feature "Viewing title show pages" do
  before(:each) do
    prepare_pugetive
  end

  scenario "as a regular visitor" do
    prepare_software
    prepare_music

    titles = Title.random(3)

    expect(titles.size).to eq 3
    titles.each do |title|
      visit title_path(title)
      expect(page).to have_content title.name
    end
  end

end
