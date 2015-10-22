CONFIG = YAML.load_file("config/pugetive.yml").with_indifferent_access
BOOLEAN_OPTIONS = [0, 1, false, true]
YEARS_OF_LIFE = Time.now.year.downto(1970)
SITE_DESCRIPTION = 'Online hub for Todd Gehman and his various amateur and professional projects.'
DIVIDER = '~'