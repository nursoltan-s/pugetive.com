SITE_TITLE = "Todd G @ pugetive.com"
BOOLEAN_OPTIONS = [0, 1, false, true]
CONFIG = YAML.load_file("config/pugetive.yml").with_indifferent_access
DIVIDER = '~'
SITE_DESCRIPTION = 'Pugetive.com is the online hub for Todd Gehman and his various amateur and professional projects. Total rewrite of the website is currently in progress. (March 2016)'
US_STATES = Carmen::Country.coded('US').subregions.map{|subregion| [subregion.code, subregion.name]}
YEARS_OF_LIFE = Time.now.year.downto(1970)
PURSUITS = ['Software', 'Music', 'Photography', 'Writing']