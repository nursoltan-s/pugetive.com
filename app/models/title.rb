class Title < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :name, presence: true
  validates :category, inclusion: {in: PURSUITS}

  has_many :roles, dependent: :destroy
  has_many :works, through: :roles

  default_scope {order(:sort)}

  scope :alpha,       -> {order(:name)}
  scope :sorted,      -> {order(:sort)}

  scope :music,       -> {where(category: 'Music')}
  scope :photography, -> {where(category: 'Photography')}
  scope :software,    -> {where(category: 'Software')} 
  scope :film,        -> {where(category: 'Film')}

  def self.categories
    #FIXME make direct SQL call
    all.each.map{|t| t.category}.uniq
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end


end
