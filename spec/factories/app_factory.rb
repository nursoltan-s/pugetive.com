FactoryBot.define do
  factory :app do
    name "Placeholder App Name"
    interest_id SOFTWARE_INTEREST_ID
    party_id 1
    start_year Time.now.year - 4
  end

end