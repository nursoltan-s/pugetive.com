require 'rails_helper'

describe App, '#random' do
  before(:each) do
    prepare_pugetive
  end

  it 'returns a random array of apps' do
    num = rand(App.count)
    results = App.random(num)
    expect(results.size).to eq(num)
    expect(results.first.interest_id).to eq(SOFTWARE_INTEREST_ID)
  end
end
