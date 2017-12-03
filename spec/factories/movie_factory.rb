FactoryBot.define do
  factory :movie do
    name "Placeholder Movie Name"
    interest_id FILM_INTEREST_ID
    party_id TODD_PARTY_ID
    start_year Time.now.year - 7
  end
end