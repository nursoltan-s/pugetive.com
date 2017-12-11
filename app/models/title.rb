class Title < ActiveRecord::Base

  include Randomable
  include Sluggable

  validates :name, presence: true
  validates :category, inclusion: {in: Interest::CATEGORIES}

  has_many :roles, dependent: :destroy
  has_many :works, through: :roles

  default_scope {order(:sort)}

  scope :alpha,       -> {order(:name)}
  scope :sorted,      -> {order(:sort)}

  scope :music,       -> {where(category: 'Music')}
  scope :photography, -> {where(category: 'Photography')}
  scope :software,    -> {where(category: 'Software')}
  scope :film,        -> {where(category: 'Film')}
  scope :writing,     -> {where(category: 'Writing')}

end
