rails g scaffold Interest name sort:integer token work_name series_name


INTEREST
  name         Music
  token        music
  work_name    Song
  series_name  Album


WORK
  interest_id music_id
  name        New York Hustle
  party_id
  url
  start_year
  stop_year
  description
  live
  official_title
  summary
  slug
  location
  equipment
  key?

  status [pre, production, post, released, scrapped, retired]

rails g scaffold Work name interest_id:integer party_id:integer url start_year:integer stop_year:integer description:text summary live:boolean slug


work_id
series_id


rails g scaffold Series name summary description:text
rails g scaffold SeriesWork series_id:integer work_id:integer

SERIES
  name
  summary
  description

SERIES_WORKS
  series_id
  work_id




VARIANT

GENRE

  

---

ACCOUNTS
  company
  username
  url

rails g scaffold Account company username url


ADDRESSES
  street
  unit
  city
  state
  zip

rails g scaffold Address street unit city state zip

EMAILS
  address
  category

rails g scaffold Email address category

NOTES
  noteable_type
  noteable_id
  contents

rails g scaffold Note noteable_type notable_id:integer contents


PARTIES
  name
  type [Company, Band]
  url
  description
  start_year
  stop_year

rails g scaffold Party name type url description start_year:integer stop_year:integer

PHONES
  number
  category

rails g scaffold Phone number category


PROJECTS
  name
  type [PhotoSeries|SoftwareApplication|RecordingProject]
  party_id
  url
  start_year
  stop_year
  description
  live?

rails g scaffold Project name type party_id:integer url start_year:integer stop_year:integer description:text live:boolean


ROLES
  project_id
  title_id

rails g scaffold Role project_id:integer title_id:integer

TITLES
  name
  category

rails g scaffold Title name category

TOOLS
  name
  type
  category
  front_end

rails g scaffold Tool name type



WIELDS
  project_id
  tool_id

rails g scaffold Wield project_id:integer tool_id:integer

rails g scaffold Award name official_title summary url live:boolean start_year:integer stop_year:integer
