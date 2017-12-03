FactoryBot.define do
  factory :piece do
    name "Placeholder Piece Name"
    interest_id WRITING_INTEREST_ID
    party_id TODD_PARTY_ID
    start_year Time.now.year - 7
  end
end