class Email < ActiveRecord::Base
  CATEGORIES = ['home', 'work']
  validates :address, presence: true
  validates :category, inclusion: {in: CATEGORIES}
end
