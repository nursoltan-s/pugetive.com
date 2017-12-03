FactoryBot.define do
  factory :photo do
    name "Placeholder Photo Name"
    party_id 1
    start_year Time.now.year - 5
  end

end