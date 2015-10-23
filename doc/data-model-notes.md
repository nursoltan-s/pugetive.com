PARTIES
  name
  type [Company, Band]
  url
  description
  start_year
  stop_year

rails g scaffold Party name type url description start_year:integer stop_year:integer

SKILLS
  name
  category
  start_year

ACTIVITY
  name

PROJECTS
  name
  category [Photography|Software|Music]
  company_id
  start_year
  stop_year
  description
  status

ARTIST
  name

SONG
  name
  url

