require 'rails_helper'

describe Piece, 'piece methods' do
  before(:each) do
    prepare_writing
  end

  it '#random returns a random array of writing pieces' do
    num = rand(10)
    expect(Piece.random(num).size).to be(num)
  end

  it 'returns a list of blogs' do
    Piece.blogs.each do |piece|
      expect(piece.name).to match(/blog/i)
    end
  end

  it 'returns a list of amazon.com reviews' do
    amazon = Party.find_by(name: 'Amazon.com')
    reviews = Piece.reviews
    expect(reviews.first.party_id).to match(amazon.id)
    expect(reviews.last.party_id).to match(amazon.id)
  end

  it 'returns a series object composed of of bad rock haiku works' do
    series = Piece.haiku
    expect(series.pieces.size).to be > 0
    expect(series.pieces.first).to be_a(Work)
  end

  it 'returns a series of misc writngs' do
    pieces = Piece.other_projects
    expect(pieces.size).to be > 0
    [pieces.first, pieces.last].each do |piece|
      expect(Piece.blogs.include?(piece)).to be false
      expect(Piece.reviews.include?(piece)).to be false
      expect(Piece.haikus.include?(piece)).to be false
    end
  end
end
