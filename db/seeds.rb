# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


  # [
  #   name: '',
  #   type: '',
  #   url:  '',
  #   start_year: ,
  #   stop_year: nil
  # ],

parties = Party.create!([
  [
    name: 'Todd Gehman',
    type: 'Artist',
    url:  'http://pugetive.com',
    start_year: 1970,
    stop_year: nil
  ],
  [
    name: 'Speler',
    type: 'Artist',
    url:  '',
    start_year: 2005,
    stop_year: 2005
  ],
  [
    name: 'The Snockerers',
    type: 'Artist',
    url:  '',
    start_year: 2006,
    stop_year: 2006
  ],
  [
    name: 'The Novemberists',
    type: 'Artist',
    url:  '',
    start_year: 2007,
    stop_year: 2007
  ],

  [
    name: 'The Shiners',
    type: 'Artist',
    start_year: 1998,
    stop_year: 2001
  ],
  [
    name: 'An American Starlet',
    type: 'Artist',
    url:  '',
    start_year: 2001,
    stop_year: 2006
  ],
  [
    name: 'Downpilot',
    type: 'Artist',
    url:  'http://downpilot.com/',
    start_year: 2005,
    stop_year: 2005
  ],
  [
    name: 'Lushy',
    type: 'Artist',
    url:  'http://lushy.com',
    start_year: 2010,
    stop_year: 2010
  ],
  [
    name: 'Cellar Homebrew',
    type: 'Company',
    url:  'http://www.cellar-homebrew.com/',
    start_year: 1994,
    stop_year: 1998
    ],
  [
    name: 'Amazon.com',
    type: 'Company',
    url:  'http://www.amazon.com',
    start_year: 1998,
    stop_year: 2004
  ],
  [
    name: 'Robot Co-op',
    type: 'Company',
    url:  '',
    start_year: 2004,
    stop_year: 2009
  ],
  [
    name: 'Urban Influence',
    type: 'Company',
    url:  'http://www.urbaninfluence.com',
    start_year: 2010,
    stop_year: 2011
  ],
  [
    name: 'Vittana',
    type: 'Company',
    url:  'http://vittana.org',
    start_year: 2011,
    stop_year: 2012
  ],
  [
    name: 'Orbridge',
    type: 'Company',
    url:  'http://www.orbridge.com',
    start_year: 2012,
    stop_year: 2014
  ],
  [
    name: 'Experi',
    type: 'Company',
    url:  'http://experi.com',
    start_year: 2014,
    stop_year: nil
  ],

])


  # [name: '',
  #  type: 'Software',
  #  party_id: 1,
  #  url:  '',
  #  start_year: ,
  #  stop_year: ,
  #  description: "",
  #  live: false
  # ],


projects = Project.create!([
  [name: 'Hopville',
   type: 'SoftwareApp',
   party_id: 1,
   url:  'http://hopville.com',
   start_year: 2008,
   stop_year: 2013,
   description: "Acted as founder and sole proprietor for this geeky/social site for amateur and small-scale professional brewers. Hopville centered around the creation, calculation, and sharing of home brewed beer recipes. In 2013 Hopville the brand, database, and software were acquired by Ackmann & Dickenson, makers of competitor site Brewtoad.com.",
   live: false
  ],
])

Email.create!(address: 'toddgehman@gmail.com',
              category: 'home')

Phone.create!(number: '206.789.0033',
              category: 'mobile')

Address.create!(street: '17 Monitor St',
                unit: 'Apt 4C',
                city: 'Brooklyn',
                state: 'NY',
                zip: 11222)

Tool.create([
  [
    name: 'Ruby on Rails',
    type: 'System',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'jQuery',
    type: 'System',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'HTML',
    type: 'Language',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'Ruby',
    type: 'Language',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'JavaScript',
    type: 'Language',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'PHP',
    type: 'Language',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'CoffeeScript',
    type: 'Language',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'Angular',
    type: 'System',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'AJAX',
    type: 'Concept',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'CSS',
    type: 'Language',
    category: 'Software',
    front_end: true
  ],

  [
    name: 'SASS',
    type: 'Language',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'HAML',
    type: 'Language',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'MySQL',
    type: 'System',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'Photoshop',
    type: 'Program',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'Responsive Design',
    type: 'Concept',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'Data Modeling',
    type: 'Concept',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'Apache',
    type: 'System',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'Drupal',
    type: 'System',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'Perl',
    type: 'Language',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'Linux',
    type: 'System',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'FreeBSD',
    type: 'System',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'Backbone',
    type: 'System',
    category: 'Software',
    front_end: true
  ],
  [
    name: 'Zurb Foundation',
    type: 'System',
    category: 'Software',
    front_end: true
  ],

  [
    name: 'System Administration',
    type: 'System',
    category: 'Software',
    front_end: false
  ],
  [
    name: 'Wordpress',
    type: 'System',
    category: 'Software',
    front_end: false
  ],
])