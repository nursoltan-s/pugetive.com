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