require 'rails_helper'

describe Album, '#band_recordings' do

  before(:each) do
    prepare_music
  end

  it 'should albums by third party artists' do
    albums = Album.band_recordings.sample(2)
    expect(albums.size).to eq 2
    albums.each do |series|
      expect(series.songs.size).to be > 0
      expect(series.songs.sample.solo?).to be false
    end
  end
end

describe Album, '#solo_recordings' do
  before(:each) do
    prepare_music
  end

  it 'should return albums by me' do
    albums = Album.solo_recordings.sample(2)
    expect(albums.size).to eq 2
    albums.each do |series|
      expect(series.songs.size).to be > 0
      expect(series.songs.sample.solo?).to be true
    end
  end

end

