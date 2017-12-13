class Todd

  delegate :summary, :objective, :address, to: :user

  def initialize
    @software = Interest.find(SOFTWARE_INTEREST_ID)
  end

  def email
    Email.first
  end

  def phone
    Phone.first
  end

  def website
    App.toddgehman
  end

  def jobs
    Party.jobs
  end

  def side_projects
    App.resume_side_projects
  end

  def non_profits
    App.resume_non_profits
  end

  def awards
    Award.all.sort_by{|c| c.start_year}.reverse
  end

  def current_tools
    Tool.resume_current
  end

  def lapsed_tools
    Tool.resume_lapsed
  end

  def update(attribute, value)
    user.update_attribute(attribute, value)
  end

  private

    def user
      User.find(1)
    end

end
