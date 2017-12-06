require 'rails_helper'

feature "Viewing sofware app pages" do

  before(:each) do
    prepare_pugetive
    prepare_software
  end

  scenario "as a regular visitor" do
    apps = App.random(3)
    expect(apps.size).to eq 3
    apps.each do |app|
      visit app_path(app)
      expect(page).to have_content app.name
      # expect(page).to have_content '<h1>Software</h1>'
    end
  end
end

feature "Viewing songs pages" do

  before(:each) do
    prepare_pugetive
    prepare_music
  end

  scenario "as a regular visitor" do
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
    prepare_pugetive
    prepare_photography
  end

  scenario "as a regular visitor" do
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
    prepare_pugetive
    prepare_film
  end

  scenario "as a regular visitor" do
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
    prepare_pugetive
    prepare_writing
  end

  scenario "as a regular visitor" do
    pieces = Piece.random(3)
    expect(pieces.size).to eq 3
    pieces.each do |piece|
      visit piece_path(piece)
      expect(page).to have_content piece.name
    end
  end
end
