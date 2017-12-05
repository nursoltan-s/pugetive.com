module PrepareHelpers
  def prepare_pugetive
    prepare_interests

    prepare_software
    prepare_music
    prepare_photography
    prepare_film
    prepare_writing
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

  def prepare_software
    developer = create(:title, name: 'Developer', category: 'Software')
    founder =   create(:title, name: 'Founder',   category: 'Software')


    amazon = create(:app,
                    name: 'amazon.com',
                    favorite: true,
                    start_year: 1998,
                    stop_year: 2004)

    fair   = create(:app,
                    name: 'fair.org',
                    favorite: true,
                    start_year: 2015,
                    stop_year: nil)

    things = create(:app,
                    name: '43 Things',
                    favorite: true,
                    start_year: 2004,
                    stop_year: 2009)

    mw     = create(:app,
                    name: "Major White",
                    favorite: false,
                    start_year: 2006,
                    stop_year: 2010)
    hopville = create(:app, name: 'Hopville', favorite: true)

    amazon.titles   << developer
    fair.titles     << developer
    things.titles   << developer
    mw.titles       << developer
    hopville.titles << developer
    hopville.titles << founder

    c         = create(:tool, name: 'C',         type: 'Language', category: 'Software', resume: true)
    perl      = create(:tool, name: 'Perl',      type: 'Language', category: 'Software', resume: true)
    php       = create(:tool, name: 'PHP',       type: 'Language', category: 'Software', resume: true)
    catsubst  = create(:tool, name: 'Catsubst',  type: 'Language', category: 'Software', resume: false)

    emacs     = create(:tool, name: 'Emacs',     type: 'Program',  category: 'Software', resume: false)
    sublime   = create(:tool, name: 'Sublime',   type: 'Program',  category: 'Software', resume: false)

    wordpress = create(:tool, name: 'Wordpress', type: 'System',   category: 'Software', resume: true)

    amazon.tools << c
    amazon.tools << perl
    amazon.tools << emacs
    amazon.tools << catsubst

    fair.tools << php
    fair.tools << wordpress
    fair.tools << sublime
  end


  def prepare_music
    songwriter = create(:title, name: 'Songwriter', category: 'Music')
    performer  = create(:title, name: 'Performer',  category: 'Music')
    mastering  = create(:title, name: 'Mastering',  category: 'Music')


    duchess     = create(:album, name: 'Duchess of Hazard')
    shingletown = create(:album, name: 'Shingletown Country')
    nyc         = create(:album, name: 'New York City')

    starlet     = create(:artist, name: 'An American Starlet', type: 'Band')
    lushy       = create(:artist, name: 'Lushy', type: 'Band')
    todd        = create(:artist, name: 'Todd Gehamn', id: TODD_PARTY_ID)

    ["Maker's Lament", 'Half a Heart', 'The Dirt'].each do |name|
      song = create(:song,
                    name: name,
                    party_id: starlet.id,
                    interest_id: MUSIC_INTEREST_ID,
                    start_year: 2004)
      duchess.songs << song
    end

    ['Aurora Boring Alice', 'Oh, Well', 'Golden Gardens', 'Wild Sands'].each do |name|
      song = create(:song, name: name, party_id: todd.id, start_year: 2015)
      shingletown.songs << song
    end

    ["Astrid's Eyes", "Subway Club", "Green-Wood"].each do |name|
      song = create(:song, name: name, party_id: todd.id, start_year: 2016)
      nyc.songs << song
    end
  end


  def prepare_photography
    portraits = create(:gallery, name: 'Portaits Portfolio')
    animals   = create(:gallery, name: 'Animals Series')
    abstract  = create(:gallery, name: 'Abstract Portfolio')
    street    = create(:gallery, name: 'Street Phography Portfolio')

    ['Second Avenue', 'Trees in St Ignatius', 'Salk Exit'].each do |name|
      photo = create(:photo, name: name)
      photo.series_works.create(work_id: photo.id, series_id: abstract.id)
    end

    ['Kaela', 'Nikki', 'Katherine', 'Kate'].each do |name|
      photo = create(:photo, name: name)
      photo.series_works.create(work_id: photo.id, series_id: portraits.id)
    end

    ['Donkey at Grand Canyon', 'Utah Bull', 'Faroe Island Goat'].each do |name|
      photo = create(:photo, name: name)
      photo.series_works.create(work_id: photo.id, series_id: animals.id)
    end

    photo = create(:photo, name: 'Tenderloin Pedestrian')
    photo.series_works.create(work_id: photo.id, series_id: street.id)

  end
end

def prepare_film
  doc = create(:genre, name: 'Documentary',  interest_id: FILM_INTEREST_ID)
  exp = create(:genre, name: 'Experimental', interest_id: FILM_INTEREST_ID)

  director = create(:title, name: 'Director', category: 'Film')
  editor   = create(:title, name: 'Editor',   category: 'Film')


  omo       = create(:movie, name: 'Omo Valley Sunday',         genre_id: doc.id)
  globetrot = create(:movie, name: '43 Countries',              genre_id: doc.id)
  cummings  = create(:movie, name: 'nobody loses all the time', genre_id: exp.id)

  omo.titles       << director
  globetrot.titles << director
  cummings.titles  << director

end

def prepare_writing
  amazon = create(:party,  name: 'Amazon.com')
  medium = create(:piece,  name: 'Medium Blog', start_year: 2015)
  haiku  = create(:series, name: 'Bad Rock Haiku')

  ['Jesse Sykes', 'Spoon', 'Mike Dumovich'].each do |name|
    piece = create(:piece, name: name)
    piece.series_works.create(work_id: piece.id, series_id: haiku.id)
  end

  ['Temperament', 'Black Sea', 'Wine for Dummies'].each do |name|
    piece = create(:piece, name: name, party_id: amazon.id, genre_id: AMAZON_GENRE_ID)
  end

  create(:piece, name: 'Skeleton Coast')

end


RSpec.configure do |c|
  c.include PrepareHelpers
end

