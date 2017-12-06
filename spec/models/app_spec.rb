require 'rails_helper'

describe App, '#random' do
  before(:each) do
    prepare_software
  end

  it 'returns a random array of apps' do
    results = App.random(3)
    expect(results.size).to eq(3)
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


describe App, '#live_link' do
  it 'should link to live urls when site is active' do
    app = create(:app, url: 'http://example.com/whatever', live: true)

    expect(app.decorate.live_link).to match /example\.com/
    expect(app.decorate.live_link).to match /Live Link/i
  end


  it 'should link to archive urls when available' do
    app = create(:app, url: "http://#{WEB_ARCHIVE_DOMAIN}/whatever", live: false)

    expect(app.decorate.live_link).to match /#{WEB_ARCHIVE_DOMAIN}/
    expect(app.decorate.live_link).to match /Internet\ Archive/i
  end

end

describe App, '#archived?' do
  before(:each) do
    prepare_pugetive
  end

  it 'should return true when URL matches ' do
    dead_app = create(:app, url: "http://#{WEB_ARCHIVE_DOMAIN}/whatever")

    expect(dead_app.archived?).to be_truthy
  end

  it 'should be false for a standard URL' do
    live_app = create(:app, url: 'http://example.com/')

    expect(live_app.archived?).to be_falsy
  end

  it 'should be false when URL is not present' do
    unlinked_app = create(:app, url: nil)

    expect(unlinked_app.archived?).to be_falsy
  end

end

