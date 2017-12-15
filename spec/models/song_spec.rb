require 'rails_helper'

describe Song do

  before(:all) do
    setup_pugetive
    setup_music
  end

  describe '#random' do
    it 'returns a random array of songs' do
      num = rand(5) + 1

      songs = Song.random(num)

      expect(songs.size).to eq num
      expect(songs.first).to be_music
    end
  end

  after(:all) do
    clean_db
  end

end
