class Title < ActiveRecord::Base

  validates :name, presence: true
  validates :category, inclusion: {in: PURSUITS}

  has_many :roles
  has_many :projects, through: :roles
end
