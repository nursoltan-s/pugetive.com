class Award < ApplicationRecord

  scope :sorted, -> {order("stop_year DESC")}

  def date_range
    DateRange.new(start_year, stop_year).years
  end
end
