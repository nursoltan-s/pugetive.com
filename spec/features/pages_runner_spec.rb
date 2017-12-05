require 'rails_helper'

feature "Vitising top level pages" do
  # background do
  #   User.make(email: 'user@example.com', password: 'caplin')
  # end
  before(:each) do
    prepare_pugetive
  end

  scenario "visiting homepage" do
    visit '/'
    expect(page).to have_content 'Photography'
  end


  scenario "visiting software page" do
    visit "/software"
    expect(page).to have_content /amazon/
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
  before(:each) do
    prepare_pugetive
  end

  scenario "Visiting app pages" do
    apps = App.random(3)
    expect(apps.size).to eq 3
    apps.each do |app|
      visit app_path(app)
      expect(page).to have_content app.name
      # expect(page).to have_content '<h1>Software</h1>'
    end
  end

  scenario "Music sample track pages" do
    songs = Song.random(3)
    expect(songs.size).to eq 3
    songs.each do |song|
      visit song_path(song)
      expect(page).to have_content song.name
    end
  end

  scenario "Visiting photo pages" do
    photos = Photo.random(3)
    expect(photos.size).to eq 3
    photos.each do |photo|
      visit photo_path(photo)
      expect(page).to have_content photo.name
    end
  end


  scenario "Visiting sample film pages" do
    movies = Movie.random(3)
    expect(movies.size).to eq 3
    movies.each do |movie|
      visit movie_path(movie)
      expect(page).to have_content movie.name
    end
  end

  scenario "Visiting sample writing piece pages" do
    pieces = Piece.random(3)
    expect(pieces.size).to eq 3
    pieces.each do |piece|
      visit piece_path(piece)
      expect(page).to have_content piece.name
    end
  end


end

feature "Visiting sample tools and titles pages" do

  before(:each) do
    prepare_pugetive
  end

  scenario "Visiting sample tool pages" do
    tools = Tool.random(3)
    expect(tools.size).to eq 3
    tools.each do |tool|
      visit tool_path(tool)
      expect(page).to have_content tool.name
    end
  end

  scenario "Visiting sample title pages" do
    titles = Title.random(3)
    expect(titles.size).to eq 3
    titles.each do |title|
      visit title_path(title)
      expect(page).to have_content title.name
    end
  end

end


feature "resume handling" do
  scenario "generating a new resume"

  scenario "downloading the public resume"

end