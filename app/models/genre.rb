class Genre < ApplicationRecord
  include Sluggable
  include Interesting

  validates :interest_id, inclusion: {in: Interest::INTEREST_IDS}
  validates :name, presence: true

  belongs_to :interest
  has_many :works

  scope :alpha, -> {order(:name)}

end
