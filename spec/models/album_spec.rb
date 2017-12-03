require 'rails_helper'

describe Album, '#band_recordings' do
  before(:each) do
    create(:album, name: 'Shingletown Country')
    create(:album, name: 'Watermelon Songs')
  end
  it 'returns albums by third party artits' do
    albums = Album.band_recordings.sample(2)
    expect(albums.size).to be > 0
    albums.each do |series|
      expect(series.songs.size).to be > 0
      expect(series.songs.sample.solo?).to be false
    end
  end

  it 'returns albums by me' do
    albums = Album.solo_recordings.sample(2)
    expect(albums.size).to be > 0
    albums.each do |series|
      expect(series.songs.size).to be > 0
      expect(series.songs.sample.solo?).to be true
    end
  end

end

