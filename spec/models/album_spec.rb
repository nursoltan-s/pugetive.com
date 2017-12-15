require 'rails_helper'

describe Album do

  before(:all) do
    setup_pugetive
    setup_music
  end

  describe '#band_recordings' do
    it "returns albums by bands I've played in" do
      albums = Album.band_recordings.sample(2)

      expect(albums.size).to eq 2
      albums.each do |series|
        expect(series.songs.size).to be > 0
        expect(series.songs.sample).not_to be_solo
      end
    end
  end

  describe '#solo_recordings' do
    it 'returns albums by me' do
      albums = Album.solo_recordings.sample(2)

      expect(albums.size).to eq 2
      albums.each do |series|
        expect(series.songs.size).to be > 0
        expect(series.songs.sample).to be_solo
      end
    end
  end

  after(:all) do
    clean_db
  end

end

