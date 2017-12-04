describe User, '#email' do

  it 'returns a the correct email address' do
    user = User.create(email: 'test@pugetive.com', password: 'test')
    expect(user.email).to eq 'test@pugetive.com'
  end
end
