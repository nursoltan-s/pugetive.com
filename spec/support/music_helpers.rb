module MusicHelpers

  def setup_music
    songwriter = create(:title, name: 'Songwriter', category: 'Music')
    performer  = create(:title, name: 'Performer',  category: 'Music')
    mastering  = create(:title, name: 'Mastering',  category: 'Music')

    duchess     = create(:album, name: 'Duchess of Hazard')
    greatest    = create(:album, name: 'Shiners Greatest Hits')
    shingletown = create(:album, name: 'Shingletown Country')
    nyc         = create(:album, name: 'New York City')
    empty       = create(:album, name: 'Empty Album')

    starlet     = create(:artist, name: 'An American Starlet', type: 'Band')
    lushy       = create(:artist, name: 'Lushy', type: 'Band')
    shiners     = create(:artist, name: 'The Shiners', type: 'Band')

    unless todd = Artist.find(TODD_PARTY_ID) rescue nil
      todd = create(:artist, name: 'Todd Gehman', id: TODD_PARTY_ID)
    end

    ["Maker's Lament", 'Half a Heart', 'The Dirt'].each do |name|
      song = create(:song,
                    name: name,
                    party_id: starlet.id,
                    interest_id: MUSIC_INTEREST_ID,
                    start_year: 2004)
      duchess.songs << song
    end

    ['Hard Hearted', "Lordy Lordy"].each do |name|
      song = create(:song, name: name, party_id: shiners.id)
      greatest.songs << song
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

end


RSpec.configure do |c|
  c.include MusicHelpers
end
