require 'rails_helper'

describe Photograph, '#random' do
  it 'returns a random array of photos' do
    num = rand(10)
    expect(Photograph.random(num).size).to be(num)
  end
end
