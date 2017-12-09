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


  describe '#thumbnail' do
    it 'should return a linked thumbnail image tag' do
      insta_photo  = create(:photo, :instagram)
      flickr_photo = create(:photo, :flickr)
      create(:flickr_url, :thumbnail, work_id: flickr_photo.id)

      expect(insta_photo.thumbnail).to  match /instagram/
      expect(flickr_photo.thumbnail).to match /flickr/
    end
  end

end
