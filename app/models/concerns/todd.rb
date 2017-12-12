class Todd

  delegate :summary, :objective, :address, to: :user

  def initialize
    @software = Interest.find(SOFTWARE_INTEREST_ID)
    @fair = NonProfit.find(FAIR_PARTY_ID)
  end

  def email
    Email.first
  end

  def phone
    Phone.first
  end

  def jobs
    [@fair] + Company.all.sort_by{|c| c.stop_year}.reverse
  end

  def side_projects
    # On the web it's nice to split pugetive.com and toddgehman.com
    # into separate apps since their history includes a lot of
    # tools and since tg.com is meant to exemplify the state of the art.
    # On the resume where we're not specifying tools, they can
    # be treated as one unified project.

    merged_app_ids = [TODDGEHMAN_APP_ID, PUGETIVE_APP_ID]

    tg       = App.find(TODDGEHMAN_APP_ID)
    pugetive = App.find(PUGETIVE_APP_ID)

    tg.start_year = pugetive.start_year

    [tg] + App.solo.sorted.reject{|app| merged_app_ids.include? app.id}
  end

  def awards
    Award.all.sort_by{|c| c.start_year}.reverse
  end

  def schools
    School.all.sort_by{|c| c.start_year}.reverse
  end

  def non_profits
    NonProfit.all.where("id != 23").sort_by{|c| c.start_year}.reverse
  end

  def update(attribute, value)
    user.update_attribute(attribute, value)
  end

  private

    def user
      User.find(1)
    end

end
