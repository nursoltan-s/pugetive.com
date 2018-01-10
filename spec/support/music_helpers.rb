module MusicHelpers

  def setup_music
    songwriter = create(:title, name: 'Songwriter', interest_id: MUSIC_INTEREST_ID)
    performer  = create(:title, name: 'Performer',  interest_id: MUSIC_INTEREST_ID)
    composer   = create(:title, name: 'Composer',   interest_id: MUSIC_INTEREST_ID)
    mastering  = create(:title, name: 'Mastering',  interest_id: MUSIC_INTEREST_ID)

    duchess     = create(:album, name: 'Duchess of Hazard')
    greatest    = create(:album, name: 'Shiners Greatest Hits')
    shingletown = create(:album, name: 'Shingletown Country')
    nyc         = create(:album, name: 'New York City')
    empty       = create(:album, name: 'Empty Album')

    starlet     = create(:artist, name: 'An American Starlet', type: 'Band')
    lushy       = create(:artist, name: 'Lushy', type: 'Band')
    shiners     = create(:artist, name: 'The Shiners', type: 'Band')

    performer   = create(:title, name: 'Performer', interest_id: MUSIC_INTEREST_ID)
    bass        = create(:tool,  name: 'Bass',      type: 'Instrument', interest_id: MUSIC_INTEREST_ID)

    todd = Artist.find(TODD_PARTY_ID) rescue nil
    if todd.nil?
      todd = create(:party, name: 'Todd Gehman', type: 'Artist', id: TODD_PARTY_ID)
    end

    a_minor = create(:key)

    ["Maker's Lament", 'Half a Heart', 'The Dirt'].each do |name|
      song = create(:song,
                    name: name,
                    party_id: starlet.id,
                    interest_id: MUSIC_INTEREST_ID,
                    start_year: 2004)
      duchess.songs  << song
      song.tools     << bass
      song.titles    << performer
    end

    ['Hard Hearted', "Lordy Lordy"].each do |name|
      song = create(:song, name: name, party_id: shiners.id)
      greatest.songs << song
      song.tools     << bass
      song.titles    << performer
    end

    ['Aurora Boring Alice', 'Oh, Well', 'Golden Gardens', 'Wild Sands'].each do |name|
      song = create(:song, name: name, party_id: todd.id, start_year: 2015)
      shingletown.songs << song
      song.tools        << bass
      song.titles       << performer
    end

    ["Astrid's Eyes", "Subway Club", "Green-Wood"].each do |name|
      song = create(:song, name: name, party_id: todd.id, start_year: 2016)
      song.key = a_minor
      nyc.songs   << song
      song.tools  << bass
      song.titles << performer
    end

    fugue = create(:song, name: 'G Minor Fugue', genre_id: CLASSICAL_GENRE_ID, party_id: TODD_PARTY_ID)
    fugue.variants << create(:variant, name: 'Arranged for String Trio')
    fugue.variants << create(:variant, name: 'Arranged for Piano')

  end

end


RSpec.configure do |c|
  c.include MusicHelpers
end
