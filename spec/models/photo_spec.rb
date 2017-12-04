require 'rails_helper'

describe Photo, '#random' do
  before(:each) do
    prepare_photography
  end

  it 'returns a random array of photos' do
    num = rand(Photo.count)
    random_photos = Photo.random(num)
    expect(random_photos.size).to eq(num)
    expect(random_photos.first.class.name).to eq('Photo')
  end
end


