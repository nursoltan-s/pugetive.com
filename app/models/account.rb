class Account < ActiveRecord::Base

  include Rangeable
  include Interesting

  validates :name,        presence: true
  validates :interest_id, numericality: true

  scope :photography, -> {where(interest_id: PHOTOGRAPHY_INTEREST_ID)}
  scope :blogs,       -> {where(interest_id: WRITING_INTEREST_ID).where("name LIKE '%blog%'")}

end
