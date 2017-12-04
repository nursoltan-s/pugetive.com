require 'rails_helper'

describe App, '#random' do
  before(:each) do
    prepare_pugetive
  end

  it 'returns a random array of apps' do
    num = rand(App.count)
    results = App.random(num)
    expect(results.size).to eq(num)
    expect(results.first).to be_an_instance_of(App)
  end
end


describe App, '#years' do
  before(:each) do
    prepare_pugetive
  end

  it 'has beginning and end years for finished projects' do
    app = create(:app, start_year: 1998, stop_year: 2004)
    expect(app.years).to match /2004/
  end

  it 'has only a start year for still-active projects' do
    app = create(:app, start_year: 1998, stop_year: nil)
    expect(app.years).to match /Now/
  end

end