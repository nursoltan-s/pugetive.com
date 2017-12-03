module PrepareHelpers
  def prepare_music
    duchess = create(:album, name: 'Duchess of Hazard')
    starlet = create(:artist, name: 'An American Starlet')

    ["Maker's Lament", 'Half a Heart', 'The Dirt'].each do |name|
      song = create(:song, name: name, party_id: starlet.id, start_year: 2004)
      song.series_works.create(series_id: duchess.id, work_id: song.id)
    end


    shingletown = create(:album, name: 'Shingletown Country')
    todd = create(:artist, name: 'Todd', id: TODD_PARTY_ID)

    ['Aurora Boring Alice', 'Oh, Well', 'Golden Gardens', 'Wild Sands'].each do |name|
      song = create(:song, name: name, party_id: todd.id, start_year: 2015)
      song.series_works.create(series_id: shingletown.id, work_id: song.id)
    end
  end


  def prepare_photography
    portraits = create(:gallery, name: 'Portaits Portfolio')
    animals = create(:gallery, name: 'Animals Series')
    abstract = create(:gallery, name: 'Abstract Portfolio')

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

  end
end

def prepare_writing
  amazon = create(:party, name: 'Amazon.com')
  medium = create(:piece, name: 'Medium Blog', start_year: 2015)
  haiku = create(:series, name: 'Bad Rock Haiku')

  ['Jesse Sykes', 'Spoon', 'Mike Dumovich'].each do |name|
    piece = create(:piece, name: name)
    piece.series_works.create(work_id: piece.id, series_id: haiku.id)
  end

  ['Temperament', 'Black Sea', 'Wine for Dummies'].each do |name|
    piece = create(:piece, name: name, party_id: amazon.id, genre_id: AMAZON_GENRE_ID)
    piece.series_works.create(work_id: piece.id, series_id: haiku.id)
  end

  create(:piece, name: 'Skeleton Coast')

end


RSpec.configure do |c|
  c.include PrepareHelpers
end

