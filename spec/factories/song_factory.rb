FactoryBot.define do
  factory :song do
    name "Placeholder Song Name"
    interest_id MUSIC_INTEREST_ID
    start_year Time.now.year.to_i - 5
    party_id TODD_PARTY_ID
  end

end