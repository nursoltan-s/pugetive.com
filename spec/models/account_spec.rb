require 'rails_helper'

describe Account do
  before do
    setup_pugetive
    create(:account, name: 'Medium Blog', interest_id: WRITING_INTEREST_ID)
    create(:account, name: 'Flickr',      interest_id: PHOTOGRAPHY_INTEREST_ID)
    create(:account, name: 'Instagram',   interest_id: PHOTOGRAPHY_INTEREST_ID)
  end

  describe '#photography' do
    it 'returns a list of photo profiles' do
      profiles = Account.photography

      expect(profiles.size).to be > 0
      profiles.each do |profile|
        expect(profile).to be_photography
      end
    end
  end


  describe '#blogs' do
    it 'returns a list of blog accounts' do
      blogs = Account.blogs

      expect(blogs.size).to be > 0
      blogs.each do |account|
        expect(account).to be_writing
      end
    end
  end

end