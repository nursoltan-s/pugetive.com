require 'rails_helper'

describe Account do
  before(:all) do
    setup_pugetive
  end

  describe '#photography' do
    it 'returns a list of photo profiles' do
      blog      = create(:account, name: 'Medium',    interest_id: WRITING_INTEREST_ID)
      flickr    = create(:account, name: 'Flickr',    interest_id: PHOTOGRAPHY_INTEREST_ID)
      instagram = create(:account, name: 'Instagram', interest_id: PHOTOGRAPHY_INTEREST_ID)

      profiles = Account.photography

      expect(profiles.size).to eq 2
      profiles.each do |profile|
        expect(profile.photography?).to be true
      end
    end
  end


  describe '#blogs' do
    it 'returns a list of blog accounts'
  end

  after(:all) do
    clean_db
  end

end