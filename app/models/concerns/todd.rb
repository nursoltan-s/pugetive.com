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
    App.resume.solo
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
