class Series < ApplicationRecord

  has_many :series_works
  has_many :works, through: :series_works
end
