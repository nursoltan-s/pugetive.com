require 'rails_helper'


describe Gallery, 'gallery methods' do
  before(:each) do
    prepare_pugetive
  end

  it '#next returns the next photos in the gallery' do
    portfolios = Gallery.portfolio.sample(2)
    expect(portfolios.size).to be > 0
    portfolios.each do |gallery|
      photos = gallery.photos.sorted
      next unless photos.size > 1
      expect(gallery.next(photos[0])).to eq photos[1]
    end
  end

  it '#prev returns the previous item in the series' do
    portfolios = Gallery.portfolio.sample(2)
    portfolios.each do |gallery|
      photos = gallery.photos.sorted
      next unless photos.size > 1
      expect(gallery.prev(photos.last)).to eq photos[photos.length - 2]
    end
  end
end
