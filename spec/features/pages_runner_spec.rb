require 'rails_helper'

feature "Vitising top level pages" do
  # background do
  #   User.make(email: 'user@example.com', password: 'caplin')
  # end
  before(:each) do
    prepare_interests
    prepare_music
    prepare_photography
    prepare_writing
  end

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


feature "Visiting sample resource show pages" do
  scenario "Visiting app pages" do
    App.random(3).each do |app|
      visit app_path(app)
      expect(page).to have_content app.name
      # expect(page).to have_content '<h1>Software</h1>'
    end
  end

  scenario "Music sample track pages" do
    Song.random(3).each do |song|
      visit song_path(song)
      expect(page).to have_content song.name
    end
  end

  scenario "Visiting sample photo pages" do
    Photo.random(3).each do |photo|
      visit photo_path(photo)
      expect(page).to have_content photo.name
    end
  end


  scenario "Visiting sample film pages" do
    Movie.random(3).each do |movie|
      visit movie_path(movie)
      expect(page).to have_content movie.name
    end
  end

  scenario "Visiting sample writing piece pages" do
    Piece.random(3).each do |piece|
      visit piece_path(piece)
      expect(page).to have_content piece.name
    end
  end


end

feature "Visiting sample tools and titles pages" do

  scenario "Visiting sample tool pages" do
    Tool.random(3).each do |tool|
      visit tool_path(tool)
      expect(page).to have_content tool.name
    end
  end

  scenario "Visiting sample title pages" do
    Title.random(3).each do |title|
      visit title_path(title)
      expect(page).to have_content title.name
    end
  end



end
