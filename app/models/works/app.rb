WEB_ARCHIVE_DOMAIN = 'web.archive.org'
MERGED_APP_IDS = [TODDGEHMAN_APP_ID, PUGETIVE_APP_ID]

class App < Work

  default_scope -> {includes(:genre, wields: :tool)}

  def self.solo(merge_pugetive = false)
    joins(:party).where("parties.id = 1 OR parties.alias = 1")
  end

  def self.resume_side_projects
    # Merge the pugetive.com codebase for inclusion on resume
    toddgehman.start_year = pugetive.start_year
    [toddgehman] + App.solo.sorted.reject{|app| MERGED_APP_IDS.include? app.id}
  end

  def self.resume_non_profits
    NonProfit.all.where("id != #{FAIR_PARTY_ID}").sort_by{|c| c.start_year}.reverse
  end

  def self.toddgehman
    App.find(TODDGEHMAN_APP_ID)
  end

  def self.pugetive
    App.find(PUGETIVE_APP_ID)
  end

  def domain
    URI.parse(url).host
  end

  def archived?
    return false if url.blank?
    url.match(/#{WEB_ARCHIVE_DOMAIN}/)
  end



end