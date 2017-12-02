require 'rails_helper'


describe Gallery, '#next' do
  it 'returns the next photos in the gallery' do
    Gallery.portfolio.sample(2).each do |gallery|
      photos = gallery.photos.sorted
      expect(gallery.next(photos[0])).to eq photos[1]
    end
  end
end


describe Gallery, '#prev' do
  it 'returns the previous item in the series' do
    Gallery.portfolio.sample(2).each do |gallery|
      photos = gallery.photos.sorted
      expect(gallery.prev(photos.last)).to eq photos[photos.size - 2]
    end
  end
end
