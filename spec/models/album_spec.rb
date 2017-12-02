require 'rails_helper'

describe Album, '#band_recordings' do
  it 'returns albums by third party artits' do
    Album.band_recordings.sample(2).each do |series|
      expect(series.songs.size).to be > 0
      expect(series.songs.sample.solo?).to be false
    end
  end

  it 'returns albums by me' do
    Album.solo_recordings.sample(2).each do |series|
      expect(series.songs.size).to be > 0
      expect(series.songs.sample.solo?).to be true
    end
  end

end
