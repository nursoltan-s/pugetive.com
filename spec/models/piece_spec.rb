require 'rails_helper'

describe Piece, '#random' do
  it 'returns a random array of writing pieces' do
    setup_writing
    num = rand(Piece.count)

    pieces = Piece.random(num)

    expect(pieces.size).to eq num
  end

end

describe Piece, '#blogs' do

  it 'returns a list of blogs' do
    setup_writing

    Piece.blogs.each do |piece|
      expect(piece.name).to match(/blog/i)
    end
  end
end

describe Piece, '#reviews' do

  it 'returns a list of amazon.com reviews' do
    setup_writing
    amazon = Party.find_by(name: 'Amazon.com')

    reviews = Piece.reviews

    expect(reviews.first.party_id).to match(amazon.id)
    expect(reviews.last.party_id).to match(amazon.id)
  end

end

describe Piece, '#haiku' do

  it 'returns a Series of bad rock haiku Works' do
    setup_writing

    series = Piece.haiku

    expect(series.pieces.size).to be > 0
    expect(series.pieces.first).to be_a(Work)
  end

end

describe Piece, '#other_projects' do
  it 'returns a list of misc writing Works' do
    setup_writing

    pieces = Piece.other_projects

    expect(pieces.size).to be > 0
    [pieces.first, pieces.last].each do |piece|
      expect(Piece.blogs.include?(piece)).to be false
      expect(Piece.reviews.include?(piece)).to be false
      expect(Piece.haikus.include?(piece)).to be false
    end
  end
end


