require 'rails_helper'

describe Photo do
  before(:all) do
    setup_pugetive
    setup_photography
  end

  describe '#random' do
    it 'returns a random array of photos' do
      num = rand(Photo.count) + 1
      random_photos = Photo.random(num)

      expect(random_photos.size).to eq(num)
      expect(random_photos.first).to be_an_instance_of(Photo)
    end
  end


end
