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





