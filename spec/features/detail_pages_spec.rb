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

feature "Viewing album pages" do

  before(:each) do
    setup_pugetive
  end

  scenario "as a visitor" do
    setup_music
    albums = Album.band_recordings.sample(2) + Album.solo_recordings.sample(2)

    expect(albums.size).to eq 4
    albums.each do |album|
      visit album_path(album)

      expect(page).to have_content album.name
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


feature "Viewing gallery pages" do
  before(:each) do
    setup_pugetive
    setup_photography
    setup_music
  end

  feature "with a current url" do
    scenario "as a visitor" do 
      gallery = create(:gallery)
      photo = create(:photo, :instagram)
      gallery.photos << photo

      visit gallery_path(gallery)

      expect(page).to have_content gallery.name

    end

  end

  feature "with a deprecated URL" do
    scenario "as a visitor" do
      gallery = create(:gallery)
      gallery.photos << create(:photo, :instagram)

      visit "/series/#{gallery.slug}"

      expect(current_path).to eq gallery.canonical_path

    end
  end

end