class Work < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def date_range
    DateRange.new(start_year, stop_year).years
  end

end
