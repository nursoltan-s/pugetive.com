require 'rails_helper'

feature "Vitising top level pages" do
  # background do
  #   User.make(email: 'user@example.com', password: 'caplin')
  # end

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
    App.random(5).each do |app|
      visit work_path(app)
      expect(page).to have_content app.name
      # expect(page).to have_content '<h1>Software</h1>'
    end
  end

  scenario "Music sample track pages" do
    Song.random(5).each do |song|
      visit work_path(song)
      expect(page).to have_content song.name
    end
  end

  scenario "Visiting sample photo pages" do
    Photo.random(5).each do |photograph|
      visit work_path(photograph)
      expect(page).to have_content photograph.name
    end
  end


  scenario "Visiting sample film pages" do
    Movie.random(5).each do |movie|
      visit work_path(movie)
      expect(page).to have_content movie.name
    end
  end

  scenario "Visiting sample writing piece pages" do
    Piece.random(5).each do |piece|
      visit work_path(piece)
      expect(page).to have_content piece.name
    end
  end


end