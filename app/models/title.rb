class Title < ActiveRecord::Base

  validates :name, presence: true
  validates :category, inclusion: {in: PURSUITS}

  has_many :roles, dependent: :destroy
  has_many :works, through: :roles

  scope :sorted, -> {order(:name)}

  scope :music, -> {where(category: 'Music')}
  scope :photography, -> {where(category: 'Photography')}
end
