require 'rails_helper'


describe Gallery, '#next' do
  before(:each) do
    setup_photography
  end

  it 'returns the next photo in the gallery' do
    portfolios = Gallery.portfolio.sample(2)

    expect(portfolios.size).to be > 0
    portfolios.each do |gallery|
      photos = gallery.photos.sorted
      next unless photos.size > 1

      expect(gallery.next(photos[0])).to eq photos[1]
    end
  end
end

describe Gallery, '#prev' do
  before(:each) do
    setup_photography
  end

  it 'returns the previous photo in the gallery' do
    portfolios = Gallery.portfolio.sample(2)

    portfolios.each do |gallery|
      photos = gallery.photos.sorted
      next unless photos.size > 1

      expect(gallery.prev(photos.last)).to eq photos[photos.length - 2]
    end
  end
end

