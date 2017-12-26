BOOLEAN_OPTIONS = [0, 1, false, true]

DIVIDER = '~'
SITE_DESCRIPTION = 'Online hub for Todd Gehman (internet handle: pugetive) and his various amateur and professional projects.'

US_STATES = Carmen::Country.coded('US').subregions.map{|subregion| [subregion.code, subregion.name]}
YEARS_OF_LIFE = Time.now.year.downto(1970)

TODD_USER_ID     = 1
TODD_PARTY_ID    = 1

AMAZON_GENRE_ID  = 11

FAIR_PARTY_ID    = 23

TODDGEHMAN_APP_ID = 3
PUGETIVE_APP_ID = 373

CLASSICAL_GENRE_ID = 13

SOFTWARE_INTEREST_ID    = 1
MUSIC_INTEREST_ID       = 2
PHOTOGRAPHY_INTEREST_ID = 3
FILM_INTEREST_ID        = 4
WRITING_INTEREST_ID     = 5