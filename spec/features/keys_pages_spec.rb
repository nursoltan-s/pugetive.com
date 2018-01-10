require 'rails_helper'

feature "Viewing Key pages" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_music
    key = Key.first
    visit key_path(key)

    expect(page).to have_content key.name
    expect(page).to have_link(key.songs.first.name, href: song_path(key.songs.first))
  end

end
