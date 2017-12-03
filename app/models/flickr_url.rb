class FlickrUrl < ApplicationRecord
  validates :work_id, numericality: true
  validates :flickraw_token, presence: true
  validates :url, presence: true

  belongs_to :work
end
