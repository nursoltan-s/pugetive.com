class Title < ActiveRecord::Base

  include Interesting
  include Randomable
  include Sluggable

  validates :name, presence: true

  has_many :roles, dependent: :destroy
  has_many :works, through: :roles

  default_scope {order(:sort)}

  scope :alpha,       -> {order(:name)}
  scope :sorted,      -> {order(:sort)}

  def self.for(interest_id)
    self.where(interest_id: interest_id)
  end
end
