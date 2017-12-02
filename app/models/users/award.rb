class Award < ApplicationRecord

  scope :sorted, -> {order("stop_year DESC")}

  def year
    start_year
  end

  def date_range
    DateRange.new(start_year, stop_year)
  end
end
