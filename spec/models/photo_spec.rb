require 'rails_helper'

describe Photo, '#random' do
  it 'returns a random array of photos' do
    num = rand(10)
    random_photos = Photo.random(num)
    expect(random_photos.size).to be(num)
    expect(random_photos.first.class).to be(Photo)
  end
end
