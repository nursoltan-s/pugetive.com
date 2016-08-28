class Title < ActiveRecord::Base

  validates :name, presence: true
  validates :category, inclusion: {in: PURSUITS}

  has_many :roles, dependent: :destroy
  has_many :projects, through: :roles

  scope :sorted, -> {order(:name)}
end
