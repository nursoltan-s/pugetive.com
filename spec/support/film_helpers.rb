module FilmHelpers
  def setup_film
    doc = create(:genre, name: 'Documentary',  interest_id: FILM_INTEREST_ID)
    exp = create(:genre, name: 'Experimental', interest_id: FILM_INTEREST_ID)

    director = create(:title, name: 'Director', interest_id: FILM_INTEREST_ID)
    editor   = create(:title, name: 'Editor',   interest_id: FILM_INTEREST_ID)


    omo       = create(:movie, name: 'Omo Valley Sunday',         genre_id: doc.id)
    globetrot = create(:movie, name: '43 Countries',              genre_id: doc.id)
    cummings  = create(:movie, name: 'nobody loses all the time', genre_id: exp.id)

    omo.titles       << director
    globetrot.titles << director
    cummings.titles  << director

  end
end

RSpec.configure do |c|
  c.include FilmHelpers
end

