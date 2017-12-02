require 'rails_helper'

describe Song, '#random' do
  it 'returns a random array of songs' do
    num = rand(10)
    expect(Song.random(num).size).to be(num)
  end
end
