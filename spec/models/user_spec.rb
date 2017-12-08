require 'rails_helper'

describe User do

  describe '#email' do
    it 'returns a the correct email address' do
      user = create(:user, email: 'test@pugetive.com', password: 'testymctesty')

      expect(user.email).to eq 'test@pugetive.com'
    end
  end

end

