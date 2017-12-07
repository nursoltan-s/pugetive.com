require 'rails_helper'

feature "Viewing sofware app pages" do

  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_software
    apps = App.random(3)

    expect(apps.size).to eq 3
    apps.each do |app|
      visit app_path(app)

      expect(page).to have_content 'Software'
      expect(page).to have_content app.name
    end
  end
end

feature "Viewing song pages" do

  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_music
    songs = Song.random(3)

    expect(songs.size).to eq 3
    songs.each do |song|
      visit song_path(song)

      expect(page).to have_content song.name
    end
  end
end

feature "Viewing photo pages" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_photography
    photos = Photo.random(3)

    expect(photos.size).to eq 3
    photos.each do |photo|
      visit photo_path(photo)

      expect(page).to have_content photo.name
    end
  end
end

feature "Viewing film show pages" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_film
    movies = Movie.random(3)

    expect(movies.size).to eq 3
    movies.each do |movie|
      visit movie_path(movie)

      expect(page).to have_content movie.name
    end
  end
end

feature "Viewing writing piece pages" do
  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_writing
    pieces = Piece.random(3)

    expect(pieces.size).to eq 3
    pieces.each do |piece|
      visit piece_path(piece)

      expect(page).to have_content piece.name
    end
  end
end
