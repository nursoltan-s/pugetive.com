WEB_ARCHIVE_DOMAIN = 'web.archive.org'

class App < Work

  default_scope -> {includes(:genre, wields: :tool)}

  def self.cached
    key = "cached-apps-#{all.cache_key}"
    works = Rails.cache.fetch key
    return works if works

    works = self.all.to_a
    Rails.cache.write key, works
    return works
  end

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