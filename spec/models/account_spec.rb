require 'rails_helper'

describe Album, 'album methods' do
  before(:each) do
    prepare_pugetive
  end

  it '#photography should return a list of photo profiles' do

    profiles = Account.photography

    expect(profiles.size).to be > 0
    profiles.each do |profile|
      expect(profile.photography?).to be_truthy
    end
  end

end


