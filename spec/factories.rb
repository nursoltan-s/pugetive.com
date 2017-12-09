FactoryBot.define do
  factory :account do
    name "Placeholder Account Name"
  end

  factory :album do
    name "Placeholder Album Name"
  end

  factory :app do
    name "Placeholder App Name"
    interest_id SOFTWARE_INTEREST_ID
    party_id 1
    start_year Time.now.year - 4
  end

  factory :artist do
    name "Placeholder Artist Name"
    start_year Time.now.year - 10
  end

  factory :email do
    id TODD_USER_ID
    address 'test@pugetive.com'
    category 'home'
  end

  factory :flickr_url do
    trait :thumbnail do
      flickraw_token :url_q
      url 'https://farm1.staticflickr.com/53/340284990_0b12d7dea4_q.jpg'
    end

    trait :large do
      flickraw_token :url_z
      url 'https://farm2.staticflickr.com/1407/558433466_927b5918ae_z.jpg'
    end
  end

  factory :gallery do
    name "Placeholder Gallery Name"
  end

  factory :genre do
    name "Placeholder Genre Name"
  end

  factory :interest do
    name "Placeholder Interest Name"
    public true
  end

  factory :movie do
    name "Placeholder Movie Name"
    interest_id FILM_INTEREST_ID
    party_id TODD_PARTY_ID
    start_year Time.now.year - 7
  end

  factory :party do
    name "Placeholder Party Name"
    type 'Company'
    start_year Time.now.year - 14
  end

  factory :phone do
    area_code 206
    central_office_number 123
    subscriber_number 0033
    category 'mobile'
  end

  factory :photo do
    name "Placeholder Photo Name"
    interest_id PHOTOGRAPHY_INTEREST_ID
    party_id 1
    start_year Time.now.year - 5
    stop_year Time.now.year - 5

    trait :instagram do
      name "Instagram Image Name"
      instagram_id 'BKWOhsMjVoJ'
      flickr_id nil
    end

    trait :flickr do
      name "Flickr Photo Name"
      flickr_id 340284990
      instagram_id nil
    end

  end

  factory :piece do
    name "Placeholder Piece Name"
    interest_id WRITING_INTEREST_ID
    party_id TODD_PARTY_ID
    start_year Time.now.year - 7
  end

  factory :series do
    name "Placeholder Series Name"
  end

  factory :song do
    name "Placeholder Song Name"
    interest_id MUSIC_INTEREST_ID
    start_year Time.now.year.to_i - 5
    party_id TODD_PARTY_ID
  end

  factory :title do
    name "Placeholder Party Name"
  end

  factory :tool do
    name "Placeholder Tool Name"
  end

  factory :user do
    id TODD_USER_ID
    email 'test@pugetive.com'
    password 'testymctesterson'
  end

end