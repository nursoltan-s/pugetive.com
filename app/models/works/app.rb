WEB_ARCHIVE_DOMAIN = 'web.archive.org'

class App < Work

  default_scope -> {includes(:genre, wields: :tool)}

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

  def self.resume
    # Merge the pugetive.com codebase for inclusion on resume
    toddgehman.start_year = pugetive.start_year
    [toddgehman] + App.sorted.reject{|app| merged_app_ids.include? app.id}
  end

  def toddgehman
    App.find(TODDGEHMAN_APP_ID)
  end

  def pugetive
    App.find(PUGETIVE_APP_ID)
  end

  def merged_app_ids
    [TODDGEHMAN_APP_ID, PUGETIVE_APP_ID]
  end

  def archived?
    return false if url.blank?
    url.match(/#{WEB_ARCHIVE_DOMAIN}/)
  end



end