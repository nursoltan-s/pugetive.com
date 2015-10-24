class Phone < ActiveRecord::Base
  CATEGORIES = ['mobile', 'home', 'work']

  validates :number, presence: true
  validates :category, inclusion: {in: CATEGORIES}
end
