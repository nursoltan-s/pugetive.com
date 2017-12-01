class App < Work
  default_scope { includes(wields: :tool).where(interest_id: SOFTWARE_INTEREST_ID) }

  belongs_to :author, class_name: 'Developer'

  def self.model_name
    Work.model_name
  end

end