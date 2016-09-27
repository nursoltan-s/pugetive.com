class Title < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :name, presence: true
  validates :category, inclusion: {in: PURSUITS}

  has_many :roles, dependent: :destroy
  has_many :works, through: :roles

  scope :sorted, -> {order(:name)}

  scope :music,       -> {where(category: 'Music')}
  scope :photography, -> {where(category: 'Photography')}
  scope :software,    -> {where(category: 'Software')} 


  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
