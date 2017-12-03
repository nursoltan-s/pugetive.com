FactoryBot.define do
  factory :photo do
    name "Placeholder Photo Name"
    interest_id PHOTOGRAPHY_INTEREST_ID
    party_id 1
    start_year Time.now.year - 5
    stop_year Time.now.year - 5
  end

end