require 'rails_helper'

describe Piece, '#random' do
  before(:each) do
    prepare_writing
  end

  it 'returns a random array of writing pieces' do
    num = rand(10)

    pieces = Piece.random(num)

    expect(pieces.size).to eq num
  end

end

describe Piece, '#blogs' do
  before(:each) do
    prepare_writing
  end

  it 'returns a list of blogs' do
    Piece.blogs.each do |piece|
      expect(piece.name).to match(/blog/i)
    end
  end
end

describe Piece, '#reviews' do
  before(:each) do
    prepare_writing
  end

  it 'returns a list of amazon.com reviews' do
    amazon = Party.find_by(name: 'Amazon.com')
    reviews = Piece.reviews
    expect(reviews.first.party_id).to match(amazon.id)
    expect(reviews.last.party_id).to match(amazon.id)
  end

end

describe Piece, '#haiku' do
  before(:each) do
    prepare_writing
  end

  it 'returns a series object composed of of bad rock haiku works' do
    series = Piece.haiku
    expect(series.pieces.size).to be > 0
    expect(series.pieces.first).to be_a(Work)
  end

end

describe Piece, '#other_projects' do
  before(:each) do
    prepare_writing
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


