FactoryBot.define do
  factory :party do
    name "Placeholder Party Name"
    type 'Company'
    start_year Time.now.year - 14
  end

end