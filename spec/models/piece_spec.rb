require 'rails_helper'

describe Piece, '#random' do
  it 'returns a random array of writing pieces' do
    num = rand(10)
    expect(Piece.random(num).size).to be(num)
  end
end
