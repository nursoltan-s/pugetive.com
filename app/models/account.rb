class Account < ActiveRecord::Base

  include Rangeable

  validates :name,        presence: true
  validates :interest_id, numericality: true

  scope :photography, -> {where(interest_id: PHOTOGRAPHY_INTEREST_ID)}


  def photography?
    interest_id == PHOTOGRAPHY_INTEREST_ID
  end

end
