require 'rails_helper'

describe App, '#model_name' do
  app = App.create(name: 'Testing Application',
                   party_id: 1,
                   start_year: Time.now.year - 2,
                   stop_year: Time.now.year)

  it 'returns name of its parent class, work ' do
    expect(app.model_name.to_s).to eq 'Work'
  end

end

describe App, '#random' do
  it 'returns a random array of apps' do
    num = rand(10)
    expect(App.random(num).size).to be(num)
  end
end
