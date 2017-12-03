BOOLEAN_OPTIONS = [0, 1, false, true]

DIVIDER = '~'
SITE_DESCRIPTION = 'Online hub for Todd Gehman (internet handle: pugetive) and his various amateur and professional projects.'

US_STATES = Carmen::Country.coded('US').subregions.map{|subregion| [subregion.code, subregion.name]}
YEARS_OF_LIFE = Time.now.year.downto(1970)

TODD_PARTY_ID = 1

FILM_INTEREST_ID        = 4
MUSIC_INTEREST_ID       = 2
PHOTOGRAPHY_INTEREST_ID = 3
SOFTWARE_INTEREST_ID    = 1
WRITING_INTEREST_ID     = 5