FactoryBot.define do
  factory :app do
    name "Placeholder App Name"
    party_id 1
    start_year Time.now.year - 4
  end

end