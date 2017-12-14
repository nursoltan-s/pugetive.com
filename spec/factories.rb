FactoryBot.define do
  factory :account do
    name "Placeholder Account Name"
    interest_id SOFTWARE_INTEREST_ID
  end

  factory :address do
    street "17 Monitor"
    city "Brooklyn"
    state "NY"
    zip "11222"
  end

  factory :award do
    name "Placeholder Award Name"
    summary "Here is my award summary, be it humble and true."
    start_year 1998
    stop_year 2004
    live true
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

  factory :collection do
    name "Placeholder Collection Name"
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

  factory :lyric do
    work_id 1
    content "My mistresses eyes are nothing like the sun."
  end

  factory :gallery do
    name "Placeholder Gallery Name"
  end

  factory :genre do
    name "Placeholder Genre Name"
    interest_id FILM_INTEREST_ID
  end

  factory :icon do
    name :edit
    type 'AwesomeIcon'
    token 'edit'
    category 'site'
  end

  factory :interest do
    name "Placeholder Interest Name"
    sort 6
    token 'placeholder'
    work_name 'placeholder'
    series_name 'bunch'
    icon :question
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

  factory :place do
    name "Seattle"
  end

  factory :role do
    work_id 1
    title_id 1
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
    name "Placeholder Title Name"
    interest_id SOFTWARE_INTEREST_ID
  end

  factory :tool do
    name "Placeholder Tool Name"
    type 'Language'
  end

  factory :user do
    id TODD_USER_ID
    email 'test@pugetive.com'
    password 'testymctesterson'
  end

  factory :work do
    name 'toddgehman.io:3000'
    party_id TODD_PARTY_ID
    interest_id SOFTWARE_INTEREST_ID
    start_year 2017
    live true
    status 'released'
    demo false
    favorite true
  end

end