require 'rails_helper'

describe Song, '#random' do

  it 'returns a random array of songs' do
    setup_music
    num = rand(5)

    songs = Song.random(num)

    expect(songs.size).to eq num
    expect(songs.first).to be_an_instance_of(Song)
  end

end
