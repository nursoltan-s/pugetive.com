FactoryBot.define do
  factory :artist do
    name "Placeholder Artist Name"
    start_year Time.now.year - 10
  end

end