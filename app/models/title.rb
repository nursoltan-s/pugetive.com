class Title < ActiveRecord::Base

  validates :name, presence: true
  validates :category, inclusion: {in: PURSUITS}
end
