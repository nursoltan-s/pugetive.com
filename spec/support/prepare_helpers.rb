module PrepareHelpers

  def prepare_pugetive
    prepare_interests
    create(:artist, name: 'Todd Gehman', id: TODD_PARTY_ID)
  end

  def prepare_interests
    create(:interest,
           name: 'Software',
           sort: 1,
           work_name: 'App',
           series_name: 'Suite',
           token: 'software',
           icon: 'laptop',
           id: SOFTWARE_INTEREST_ID)
    create(:interest,
           name: 'Music',
           sort: 2,
           series_name: 'Album',
           work_name: 'Song',
           token: 'music',
           icon: 'music-note',
           id: MUSIC_INTEREST_ID)
    create(:interest,
           name: 'Photography',
           sort: 3,
           work_name: 'Photo',
           series_name: 'Gallery',
           token: 'photography',
           icon: 'camera',
           id: PHOTOGRAPHY_INTEREST_ID)
    create(:interest,
           name: 'Film',
           sort: 4,
           work_name: 'Movie',
           series_name: 'Series',
           token: 'film',
           icon: 'movie-camera',
           id: FILM_INTEREST_ID)
    create(:interest,
           name: 'Writing',
           sort: 5,
           work_name: 'Piece',
           series_name: 'Series',
           token: 'writing',
           icon: 'pen',
           id: WRITING_INTEREST_ID)
  end

end


RSpec.configure do |c|
  c.include PrepareHelpers
end


