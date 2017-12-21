require 'rails_helper'

describe App do
  before(:all) do
    setup_pugetive
    setup_software
  end

  describe '#random' do
    it 'returns a random array of apps' do
      results = App.random(3)

      expect(results.size).to eq(3)
      expect(results.first).to be_software
    end
  end

  describe '#years' do
    it 'includes beginning and end years for finished projects' do
      app = create(:app, start_year: 1998, stop_year: 2004)

      expect(app.years).to match /2004/
      expect(app.years).to match /1998/
    end

    it 'includes only a start year for still-active projects' do
      app = create(:app, start_year: 1998, stop_year: nil)

      expect(app.years).to match /Now/
    end


    it 'includes only a single year for within-year projects' do
      app = create(:app, start_year: 2003, stop_year: 2003)

      expect(app.years).to match 2003
    end
  end


  describe '#live_link' do
    it 'links to live urls for active sites' do
      app = create(:app, url: 'http://example.com/whatever', live: true)

      expect(app.decorate.live_link).to match /example\.com/
      expect(app.decorate.live_link).to match /Live Link/i
    end


    it 'links to archive urls when site is inactive but archive is available' do
      app = create(:app, url: "http://#{WEB_ARCHIVE_DOMAIN}/whatever", live: false)

      expect(app.decorate.live_link).to match /#{WEB_ARCHIVE_DOMAIN}/
      expect(app.decorate.live_link).to match /Internet\ Archive/i
    end

    it "doesn't link to anything if site is inactive and unarchived" do
      app = create(:app, url: 'http://example.com/whatever', live: false)

      expect(app.decorate.live_link).to be_blank
    end

  end

  describe '#archived?' do

    it 'returns true when URL matches ' do
      dead_app = create(:app, url: "http://#{WEB_ARCHIVE_DOMAIN}/whatever")

      expect(dead_app.archived?).to be_truthy
    end

    it 'returns false for a standard URL' do
      live_app = create(:app, url: 'http://example.com/')

      expect(live_app.archived?).to be_falsy
    end

    it 'returns false when URL is not present' do
      unlinked_app = create(:app, url: nil)

      expect(unlinked_app.archived?).to be_falsy
    end
  end

  after(:all) do
    clean_db
  end

end

