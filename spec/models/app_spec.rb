require 'rails_helper'

describe App, '#random' do
  before(:each) do
    ['Amazon.com', 'Hopville', 'fair.org', 'Major White', 'Experi', 'Orbridge'].each do |name|
      create(:app, name: name)
    end
  end

  it 'returns a random array of apps' do
    num = rand(App.count)
    results = App.random(num)
    expect(results.size).to eq(num)
    expect(results.first).to be_a(App)
  end
end
