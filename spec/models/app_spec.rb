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