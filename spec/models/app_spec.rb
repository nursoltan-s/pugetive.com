require 'rails_helper'

describe App, '#random' do
  it 'returns a random array of apps' do
    num = rand(10)
    results = App.random(num)
    expect(results.size).to be(num)
    expect(results.first).to be_a(App)
  end
end
