class Address < ActiveRecord::Base
  validates :street, presence: true
  validates :city, presence: true
  validates :state, inclusion: {in: US_STATES.map{|s| s.first}}
  validates :zip, presence: true
end
