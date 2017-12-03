require 'rails_helper'


describe Song do
  before(:each) do
    prepare_music
  end

  it 'returns a random array of songs' do
    num = rand(5)
    expect(Song.random(num).size).to be(num)
  end

end
