class Work < ApplicationRecord

  STATUSES = ['pre', 'production', 'post', 'released', 'scrapped', 'retired']

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :status, inclusion: {in: STATUSES}

  belongs_to :interest
  belongs_to :party

  scope :sorted, -> {order("stop_year IS NULL DESC, stop_year DESC")}

  def date_range
    DateRange.new(start_year, stop_year).years
  end


  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end


end
