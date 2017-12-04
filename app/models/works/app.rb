WEB_ARCHIVE_DOMAIN = 'web.archive.org'

class App < Work
  default_scope { software }

  def years
    if read_attribute(:stop_year).nil?
      stop = 'Now'
    else
      stop = stop_year
    end

    "#{start_year} - #{stop}"
  end

  def self.solo
    joins(:party).where("parties.id = 1 OR parties.alias = 1")
  end

  def archived?
    return false if url.blank?
    url.match(/#{WEB_ARCHIVE_DOMAIN}/)
  end

end