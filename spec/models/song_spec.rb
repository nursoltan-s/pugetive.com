require 'rails_helper'


describe Song, '#random' do
  before(:each) do
    prepare_music
  end

  it 'returns a random array of songs' do
    num = rand(5)

    songs = Song.random(num)

    expect(songs.size).to eq num
  end

end
